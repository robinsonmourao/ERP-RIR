onclick = (event) => {
  var flashDiv = document.getElementById("flash-text");

  var divNotice = document.querySelector(".div-notice");
  var divSuccess = document.querySelector(".div-success");
  var divError = document.querySelector(".div-error");

  if (flashDiv != null){
    const transicaoSaidaFlash = "slideDown"
    addEventListener("click", (event) => {});

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

  if (!defaultOptionRadioButton && !secondOptionRadioButton) { return; }

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

document.addEventListener('DOMContentLoaded', function() {
  var validationMessages = [['O tamanho da senha deve estar entre 8 e 12 caracteres.'],
                            ['Este valor deve ser maior que 0.'],
                            ['O tamanho do cnpj deve ser 14.']]

  const passwordDigest = document.getElementById('usuario_password');
  const velocidadeContratada = document.getElementById('site_velocidade_contratada');
  const velocidadeDownField = document.getElementById('atendimento_velocidade_down');
  const velocidadeUpField = document.getElementById('atendimento_velocidade_up');
  const cnpjField = document.getElementById('cliente_cnpj');

  if(passwordDigest){
    validatePasswords(passwordDigest);
  }else if (velocidadeContratada || (velocidadeDownField && velocidadeUpField)) {
    if (velocidadeContratada) { 
      validateVelocidades(velocidadeContratada);
    }else if(velocidadeDownField && velocidadeUpField){
      validateVelocidades(velocidadeDownField);
      validateVelocidades(velocidadeUpField);
    }
  }else if(cnpjField){
		validateCnpj(cnpjField)
  }

  function validateCnpj(field){
	field.addEventListener('input', function() {
		if (isLength14(field)) {
		  field.setCustomValidity(validationMessages[2]);
		} else {
		  field.setCustomValidity('');
		}
		field.reportValidity();
	  });
  }

  function validatePasswords(field) {
    field.addEventListener('input', function() {
      if (isLengthBetween8And12(field)) {
        field.setCustomValidity(validationMessages[0]);
      } else {
        field.setCustomValidity('');
      }
      field.reportValidity();
    });
  }

  function validateVelocidades(field) {
    field.addEventListener('input', function() {
      if (isFloat(field) && isValueGreaterThan0(field)) {
        field.setCustomValidity(validationMessages[1]);
      } else {
        field.setCustomValidity('');
      }
      field.reportValidity();
    });
  }

  function isLength14(field){
    const value = (field.value);
    return ((value.trim() !== "") && (value.length != 14))
  }

  function isLengthBetween8And12(field){
    const value = (field.value);
    return ((value.trim() !== "") && (value.length < 8 || value.length > 12))
  }

  function isValueGreaterThan0(field){
    const value = field.value;
    return ((value.trim() !== "") && (value <= 0))
  }

  function isFloat(field){
    const value = parseFloat(field.value)
    return !isNaN(value) && isFinite(value);
  }
});
