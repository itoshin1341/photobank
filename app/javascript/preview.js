document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('tweet_photo')){
    const PhotoList = document.getElementById('photo-list');

    // 選択した画像を表示する関数
    const createPhotoHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const photoElement = document.createElement('div');

     // 表示する画像を生成
     const blobPhoto = document.createElement('img');
     blobPhoto.setAttribute('src', blob);
     // 生成したHTMLの要素をブラウザに表示させる
     photoElement.appendChild(blobPhoto);
     PhotoList.appendChild(photoElement);
   };

    document.getElementById('tweet_photo').addEventListener('change', function(e){
        // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const photoContent = document.querySelector('img');
      if (photoContent){
        photoContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createPhotoHTML(blob);
    });
  }
});