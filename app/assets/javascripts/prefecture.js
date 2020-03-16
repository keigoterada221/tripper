 $(function() {
  $(".hokkaido-ck").click(function() {
    $('input:checkbox[value ="1"]').prop("checked",true);
  });
  $(".tohoku-ck").click(function() {
    $('input:checkbox[value ="2"],[value ="3"],[value ="4"],[value ="5"],[value ="6"],[value ="7"]').prop("checked",true);
  });
  $(".kanto-ck").click(function() {
    $('input:checkbox[value ="8"],[value ="9"],[value ="10"],[value ="11"],[value ="12"],[value ="13"],[value ="14"]').prop("checked",true);
  });
  $(".chubu-ck").click(function() {
    $('input:checkbox[value ="15"],[value ="16"],[value ="17"],[value ="18"],[value ="19"],[value ="20"],[value ="21"],[value ="22"],[value ="23"],[value ="24"]').prop("checked",true);
  });
  $(".kinki-ck").click(function() {
    $('input:checkbox[value ="25"],[value ="26"],[value ="27"],[value ="28"],[value ="29"],[value ="30"]').prop("checked",true);
  });
  $(".chugoku-ck").click(function() {
    $('input:checkbox[value ="31"],[value ="32"],[value ="33"],[value ="34"],[value ="35"]').prop("checked",true);
  });
  $(".shikoku-ck").click(function() {
    $('input:checkbox[value ="36"],[value ="37"],[value ="38"],[value ="39"]').prop("checked",true);
  });
  $(".kyusyu-ck").click(function() {
    $('input:checkbox[value ="40"],[value ="41"],[value ="42"],[value ="43"],[value ="44"],[value ="45"],[value ="46"],[value ="47"]').prop("checked",true);
  });
  $(".reset-ck").click(function() {
    $('input:checkbox').prop("checked",false);
  });
});