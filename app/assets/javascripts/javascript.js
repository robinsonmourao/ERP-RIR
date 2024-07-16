const transicaoSaidaFlash = "slideDown"

addEventListener("click", (event) => {});

onclick = (event) => {
  var flashDiv = document.getElementById("flash-text");

  var divNotice = document.querySelector(".div-notice");
  var divSuccess = document.querySelector(".div-success");
  var divError = document.querySelector(".div-error");
  
  if (flashDiv != null){
    if (presenteNaTela(divNotice)){
      
      divNotice.style.animation = transicaoSaidaFlash+" 0.2s ease-in forwards";
      setTimeout(function() {
        divNotice.style.display = "none";
      }, 200);
    } 
    else if (presenteNaTela(divSuccess)){

      divSuccess.style.animation = transicaoSaidaFlash+" 0.2s ease-in forwards";
      setTimeout(function() {
        divSuccess.style.display = "none";
      }, 200);
    }
    else if (presenteNaTela(divError)){

      divError.style.animation = transicaoSaidaFlash+" 0.2s ease-in forwards";
      setTimeout(function() {
        divError.style.display = "none";
      }, 200);
    }
  }
};
function presenteNaTela(elemento){
  return elemento.innerHTML.trim() !== '';
}

document.addEventListener('DOMContentLoaded', function() {
  const closeAccountLink = document.querySelector('.close-account-link-autohide');
  const accountOverviewBottom = document.querySelector('.container-close-account-option');

  function collapseAll(){
    accountOverviewBottom.style.display = 'none';
  }
  
  if (closeAccountLink && accountOverviewBottom) {
    closeAccountLink.addEventListener('click', function(event) {

      event.preventDefault();
      collapseAll();
      accountOverviewBottom.style.display = 'block';
    });
  }
});

document.addEventListener('DOMContentLoaded', function() {
  const defaultOptionRadioButton = document.getElementById('default-option-radio-button');
  const secondOptionRadioButton = document.getElementById('second-option-radio-button');

  const caixaDeTextoExpandable = document.querySelector('.caixa-de-texto-expandable');
  const ExpandableTextField = document.getElementById('expandable_text');

  function getExpandableOption() {
    if (defaultOptionRadioButton.checked) {
      caixaDeTextoExpandable.style.display = 'none';
      ExpandableTextField.required = false;
      ExpandableTextField.value = '';
    } else if (secondOptionRadioButton.checked) {
      caixaDeTextoExpandable.style.display = 'block';
      ExpandableTextField.required = true;
    }
  }
  getExpandableOption();

  defaultOptionRadioButton.addEventListener('change', getExpandableOption);
  secondOptionRadioButton.addEventListener('change', getExpandableOption);
});
