// プレビュー機能
$(function() {
	  // $fileFieldにidを代入
	  $fileField = $('#upload-video')
	  // $fileFieldに変化が起きた時に作動
	  $($fileField).on('change', $fileField, function(e) {
	  	// filesの0番目を取得(consoleを確認)
	  	file = e.target.files[0];
	      // FileReaderオブジェクトを生成
	      read = new FileReader(),
	      $preview = $("#movie-preview");
	      // 読み込んでから実行
	      read.onload = (function(file) {
	      	return function(e) {
	      		$preview.empty();
	      		$preview.append($('<video>').attr({
	      			src: e.target.result,
	      			width: "100%",
	      			class: "preview-video",
	      			autoplay: "autoplay",
	      			loop: "loop"
	      		}));
	      	};
	      })(file);
	      // ファイルをURLに変換
	      read.readAsDataURL(file);
	  });
	});
