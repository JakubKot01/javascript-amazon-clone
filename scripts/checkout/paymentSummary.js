//import { cart, updateCartQuantity } from "../../data/cart.js";
import { getProduct } from "../../data/products.js";
import { getDeliveryOption, calculateDeliveryDateToSQL } from "../../data/deliveryOptions.js";
import { formatCurrency } from "../utils/money.js";
import { addOrder } from "../../data/orders.js";
import { cart } from "../../data/cart-class.js";

export function renderPaymentSummary() {
  let productPriceCents = 0;
  let shippingPriceCents = 0;

  cart.cartItems.forEach((cartItem) => {
    const product = getProduct(cartItem.productId);
    productPriceCents += product.priceCents * cartItem.quantity;

    const deliveryOption = getDeliveryOption(cartItem.deliveryOptionId);
    shippingPriceCents += deliveryOption.priceCents;
  });

  const totalBeforeTaxCents = productPriceCents + shippingPriceCents;
  const taxCents = totalBeforeTaxCents * 0.1;
  const totalCents = totalBeforeTaxCents + taxCents;
  const paymentSummaryHTML = `
        <div class="payment-summary-title">
                Order Summary
            </div>

            <div class="payment-summary-row">
                <div>Items (${cart.updateCartQuantity()}):</div>
                <div class="payment-summary-money">
                $${formatCurrency(productPriceCents)}
                </div>
            </div>

            <div class="payment-summary-row">
                <div>Shipping &amp; handling:</div>
                <div class="payment-summary-money js-total-shipping-price">
                $${formatCurrency(shippingPriceCents)}
                </div>
            </div>

            <div class="payment-summary-row subtotal-row">
                <div>Total before tax:</div>
                <div class="payment-summary-money">
                $${formatCurrency(totalBeforeTaxCents)}
                </div>
            </div>

            <div class="payment-summary-row">
                <div>Estimated tax (10%):</div>
                <div class="payment-summary-money">
                    $${formatCurrency(taxCents)}
                </div>
            </div>

            <div class="payment-summary-row total-row">
                <div>Order total:</div>
                <div class="payment-summary-money js-total-price">
                    $${formatCurrency(totalCents)}
                </div>
            </div>

            <button class="place-order-button button-primary js-place-order">
                Place your order
            </button>
    `;

  document.querySelector(".js-payment-summary").innerHTML = paymentSummaryHTML;

  document
    .querySelector(".js-place-order")
    .addEventListener("click", async () => {
      if (cart.cartItems.length !== 0) {
        try {
          const response = await fetch("http://localhost:5000/order", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              order_id: crypto.randomUUID(),
              totalValue: formatCurrency(totalCents),
              orderDate: new Date(),

              items: cart.cartItems.map((item) => ({
                product_id: item.productId,
                quantity: item.quantity,
                delivery_date: calculateDeliveryDateToSQL(getDeliveryOption(item.deliveryOptionId)),
              })),
            }),
          });

          if (!response.ok) {
            throw new Error("Nie udało się zapisać zamówienia");
          }

          const order = await response.json();
          addOrder(order);
          cart.resetCart();
        } catch (error) {
          console.log("Unexpected error. Try again later.");
        }

        window.location.href = "orders.html";
      }
    });
}

// if(cart.cartItems.length !== 0){
//             fetch('http://localhost:5000/orders', {
//                 method: 'POST',
//                 headers: {
//                     'Content-Type' : 'application/json'
//                 },
//                 body: JSON.stringify({
//                     id: crypto.randomUUID(),
//                     totalValue: 300,
//                     orderDate: new Date().toISOString()
//                 })
//             })
//             .then(response => {
//                 if(!response.ok){
//                     throw new Error("Błąd zapisu zamówienia");
//                 }
//                 alert('Zamówienie zapisane!');
//             })
//             .catch(error => {
//                 console.error(error);
//             })

// document.querySelector('.js-place-order').addEventListener('click', async () => {
//         this.preventDefault()
//         if(cart.cartItems.length !== 0){
//             try{
//                 const response = await fetch('https://supersimplebackend.dev/orders', {
//                     method: 'POST',
//                     headers: {
//                         'Content-Type': 'application/json'
//                     },
//                     body: JSON.stringify({
//                         cart: cart
//                     })
//                 });

//                 const order = await response.json();
//                 console.log(order);
//                 addOrder(order);
//                 cart.resetCart();
//             } catch (error) {
//                 console.log('Unexpected error. Try again later.');
//             }
//             window.location.href = 'orders.html';
//         }
//     })
// }
