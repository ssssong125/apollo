const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");
// const userId = $("#userId").val();

function deleteProductInCart(cartNo) {

    const count = 0;

    $.ajaxSetup({
        url: 'trolley', // 요청할 서버url
        type: "POST" // 타입 (get, post, put 등등)
        // global: false, // 동시에 실행 x, 비동기화 여부 (default : true)
    });

    $.ajax({
        data: // 보낼 데이터 (Object , String, Array)
            {
                cartNo : cartNo,
                count : count
            },
        beforeSend : function(xhr) {
            xhr.setRequestHeader(header, token)
        }
        // dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
        // headers : {              // Http header
        //     "Content-Type" : "application/json",
        //     "X-HTTP-Method-Override" : "POST"
        // },
    })
        .done(function (result) { // 수행할 동작
            return location.href = "trolley"
        })
        .fail(function(jqXHR) { // 실패시
            alert("실패")
        })
    // .always(function() { // 항상 동작
    //     alert("작동");
    // })
}

function updateQty(cartNo, code) {

    const count = $('#productQty'+code).val();

    if (count%1 != 0) {
        alert("정수를 입력해주세요.")
        return false;
    }

    sum(size);

    $.ajaxSetup({
        url: 'trolley', // 요청할 서버url
        type: "POST" // 타입 (get, post, put 등등)
        // global: false, // 동시에 실행 x, 비동기화 여부 (default : true)
    });

    $.ajax({
        data: // 보낼 데이터 (Object , String, Array)
            {
                cartNo : cartNo,
                count : count
            },
        beforeSend : function(xhr) {
            xhr.setRequestHeader(header, token)
        }
        // dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
        // headers : {              // Http header
        //     "Content-Type" : "application/json",
        //     "X-HTTP-Method-Override" : "POST"
        // },
    })
        .done(function (result) { // 수행할 동작
            // return location.href = "trolley"
        })
        .fail(function(jqXHR) { // 실패시
            // alert("실패!")
        })
        // .always(function() { // 항상 동작 
        //     alert("작동");
        // })
}
