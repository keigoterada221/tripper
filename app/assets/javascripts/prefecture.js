 $(function() {
  $("#hokkaido-ck").click(function() {
    var hokkaido = $('input:checkbox[value ="1"]');
    trueFalse(hokkaido,this);
  });
  $("#tohoku-ck").click(function() {
    var tohoku = $('input:checkbox[value ="2"],[value ="3"],[value ="4"],[value ="5"],[value ="6"],[value ="7"]');
    trueFalse(tohoku,this);
  });
  $("#kanto-ck").click(function() {
    var kanto = $('input:checkbox[value ="8"],[value ="9"],[value ="10"],[value ="11"],[value ="12"],[value ="13"],[value ="14"]');
    trueFalse(kanto,this);
  });
  $("#chubu-ck").click(function() {
    var chubu = $('input:checkbox[value ="15"],[value ="16"],[value ="17"],[value ="18"],[value ="19"],[value ="20"],[value ="21"],[value ="22"],[value ="23"],[value ="24"]');
    trueFalse(chubu,this);
  });
  $("#kinki-ck").click(function() {
    var kinki = $('input:checkbox[value ="25"],[value ="26"],[value ="27"],[value ="28"],[value ="29"],[value ="30"]');
    trueFalse(kinki,this)
  });
  $("#chugoku-ck").click(function() {
    var chugoku = $('input:checkbox[value ="31"],[value ="32"],[value ="33"],[value ="34"],[value ="35"]');
    trueFalse(chugoku,this)
  });
  $("#shikoku-ck").click(function() {
    var shikoku = $('input:checkbox[value ="36"],[value ="37"],[value ="38"],[value ="39"]');
    trueFalse(shikoku,this)
  });
  $("#kyusyu-ck").click(function() {
    var kyusyu = $('input:checkbox[value ="40"],[value ="41"],[value ="42"],[value ="43"],[value ="44"],[value ="45"],[value ="46"],[value ="47"]');
    trueFalse(kyusyu,this)
  });
  $("#reset-ck").click(function() {
    $('input:checkbox').prop("checked",false);
  });
});

 // 真偽判定の関数
 function trueFalse(area,t) {
    if ($(t).prop("checked")) {
    area.prop("checked",true);
    } else {
    area.prop("checked",false);
    }
  }


