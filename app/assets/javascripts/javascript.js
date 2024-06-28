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

function presenteNaTela(elemento){
  return elemento.innerHTML.trim() !== '';
}
