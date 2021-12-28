window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = Math.floor(priceInput.value * 0.1)
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = Math.floor(priceInput.value - priceInput.value * 0.1)
})
});
