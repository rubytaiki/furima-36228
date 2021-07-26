function caliculate (){
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener('input', () =>{
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
        tax = 0.1;
        addTaxDom.innerHTML = Math.floor (inputValue * tax).toLocaleString();
      const addProfitDom = document.getElementById("profit");
        addProfitDom.innerHTML = Math.floor(inputValue - (inputValue * tax)).toLocaleString(); 
  });
};
window.addEventListener('load',caliculate);