window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const addTax = inputValue * 0.1;
  addTaxDom.innerHTML = addTax;

  const profitDom = document.getElementById("profit");
  const profit = inputValue - addTax;
  profitDom.innerHTML = profit;

  })
})

