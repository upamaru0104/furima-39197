document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const itemForm = document.getElementById('item-image');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!itemForm) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[images][]"]');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){

    // data-index（何番目を操作しているか）を取得
    const dataIndex = e.target.getAttribute('data-index');
    console.log( dataIndex);

    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);

    // 2枚目用のfile_fieldを作成
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'item[images][]');

    // 最後のfile_fieldを取得
    const lastFileField = document.querySelector('input[type="file"][name="post[images][]"]:last-child');
    // nextDataIndex = 最後のfile_fieldのdata-index + 1
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);
    

    // 生成したfile_fieldを表示
    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  });
});