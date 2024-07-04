function pullDown() {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const minusTaxDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    minusTaxDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  });
}
window.addEventListener('load', pullDown)
window.addEventListener('turbo:render', pullDown)
