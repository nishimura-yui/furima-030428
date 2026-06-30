function calc(){
  
  const priceInput = document.getElementById('item-price');
  if (!priceInput) return;
  
  priceInput.addEventListener('input',() =>{
    const price = parseInt(priceInput.value,10);
    const taxDom = document.getElementById('add-tax-price');
    const profitDom = document.getElementById('profit');
    if(isNaN(price)){
      taxDom.textContent = '';
      profitDom.textContent ='';
      return;
    }

    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    taxDom.textContent = tax;
    profitDom.textContent = profit;
  });
}
document.addEventListener('turbo:load', calc);