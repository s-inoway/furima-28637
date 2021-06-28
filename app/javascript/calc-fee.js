function calc() {
  const price = document.getElementById("item-price")
  price.addEventListener("input", () => {
    const input = price.value;
    const tax = document.getElementById("add-tax-price");
    const calcTax = Math.ceil(input * 0.1)
    tax.innerHTML = `${calcTax}` ;

    const profit = document.getElementById("profit");
    const calcProfit = input - calcTax
    profit.innerHTML = `${calcProfit}`;
  });
}

window.addEventListener("load", calc);
