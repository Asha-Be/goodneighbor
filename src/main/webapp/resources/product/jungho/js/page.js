
function page() {
  var currentPage = 1;  // 현재 페이지
  var pageSize = 6;     // 한 페이지에 보여줄 데이터의 개수

  function getPhotoList() {
    $.ajax( {
      url: ' /goodneighbor/product/listProduct ',
      type: "GET",
      data: {
        page: currentPage,
        size: pageSize
      },
      success: function ( response ) {
        // 서버에서 가져온 데이터를 화면에 출력합니다.
        var startIndex = ( currentPage - 1 ) * pageSize;
        var endIndex = startIndex + pageSize;
        for ( var i = startIndex; i < endIndex && i < response.length; i++ ) {
          var photo = response[ i ];
          var html = "<div class='gallery_product col-auto filter " + ( i + 1 ) + "'>";
          html += "<img src='" + photo.url + "' alt='" + photo.title + "'>";
          html += "<div class='caption'>" + photo.title + "</div>";
          html += "</div>";
          $( "#photoList" ).append( html );
        }

        // 페이지 이동 버튼을 생성합니다.
        var totalPages = Math.ceil( response.totalCount / pageSize );
        for ( var i = 1; i <= totalPages; i++ ) {
          var html = "<button onclick='movePage(" + i + ")'>" + i + "</button>";
          $( "#pageButtons" ).append( html );
        }
      }
    } );
  }

  function movePage( page ) {
    // 페이지 이동 버튼을 클릭했을 때 호출되는 함수입니다.
    currentPage = page;
    $( "#photoList" ).empty();   // 이전에 출력된 데이터를 모두 지웁니다.
    getPhotoList();  // 페이지 이동 후 데이터를 다시 가져옵니다.
  }
}