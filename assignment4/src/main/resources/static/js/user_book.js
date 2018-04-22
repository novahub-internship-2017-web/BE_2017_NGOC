const BTN_BOOK_ALL_PRESSED = 1;
const BTN_MY_BOOK_PRESSED = 2;
var urlRequestSearchBook, bookList, stateBookForm, wordsSearch;


urlRequestSearchBook = window.location.origin + "/api/books/user/" + userId;

$("#btn-all").click(function(){
   urlRequestSearchBook = window.location.origin + "/api/books/user/" + userId;

    if(bookList.length > 0){
        showBooksResult(bookList);
    }
});


$("#btn-my-book").click(function(){
    urlRequestSearchBook = window.location.origin + "/api/user/" + userId + "/books";
    
    var booksListTemp = [];
    

    for(var bookIndex = 0; bookIndex < bookList.length; bookIndex++){
        if(bookList[bookIndex].userId == userId){
            booksListTemp.push(bookList[bookIndex]);
        }
    }

    if(booksListTemp.length > 0){
        showBooksResult(booksListTemp);
    }
});

$("#button-search").click(function () {
     wordsSearch = $("#text-search").val();

    searchBooks(wordsSearch);
});

function searchBooks(wordsSearch){
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: urlRequestSearchBook,
        headers : {"wordsSearch" : wordsSearch},
        dataType: 'json',
        timeout: 10000,
        success: function (dataReceive) {
            if(dataReceive.object.length === 0){
                showMessageNotFound();
            } else {
                bookList = dataReceive.object;
                showBooksResult(bookList);
            }
        },
        error: function (e) {
            console.log("ERROR : ", e);
        }
    });
}

function showMessageNotFound(){
    $("#books-list").hide();
    $("#div-book-not-found").show();
}

function showBooksResult(books){
    $("#books-list").show();
    $("#div-book-not-found").hide();

    $("tbody").remove();

    table_books_list = document.getElementById("books-list");
    tbody = document.createElement("tbody");
    table_books_list.appendChild(tbody);

    var bookIndex;
    for(bookIndex = 0; bookIndex < books.length; bookIndex++){
        showABookResult(books[bookIndex]);
    }
}

function showABookResult(aBookResult){
    tr_a_book = document.createElement("tr");
    tbody.appendChild(tr_a_book);

    th_a_book_id = document.createElement("th");
    th_a_book_id.innerText = aBookResult.id;
    tr_a_book.appendChild(th_a_book_id);

    td_a_book_title = document.createElement("td");
    a_a_book_title = document.createElement("a");
    a_a_book_title.id = "title-" + aBookResult.id;
    a_a_book_title.innerText = aBookResult.title;
    a_a_book_title.setAttribute("data-toggle", "modal");
    a_a_book_title.setAttribute("href", "#bookViewModal");
    a_a_book_title.setAttribute("onClick", "onClickLinkBook(" + aBookResult.id + ")");
    td_a_book_title.appendChild(a_a_book_title);
    tr_a_book.appendChild(td_a_book_title);

    td_a_book_author = document.createElement("td");
    td_a_book_author.id = "author-" + aBookResult.id;
    td_a_book_author.innerText = aBookResult.author;
    tr_a_book.appendChild(td_a_book_author);

    td_a_book_methods = document.createElement("td");
    td_a_book_methods.setAttribute("align", "center");
    
    if(aBookResult.userId === userId){
        button_edit = document.createElement("a");
        button_edit.setAttribute("data-toggle", "modal");
        button_edit.setAttribute("data-target", "#exampleModal");
        button_edit.className = "btn btn-primary btnEdit";
        button_edit.id = "btnEdit-" + userId;
        button_edit.innerText = "Edit";
        button_edit.setAttribute("onclick", "onClickEditButton(" + aBookResult.id  + ")");
        td_a_book_methods.appendChild(button_edit);
    }

    tr_a_book.appendChild(td_a_book_methods);
}

function clearBookForm(){
    $("#title").val("");
    $("#author").val("");
    $("#description").val("");
}

const BTN_ADD_BOOK_PRESSED = 3;
const BTN_EDIT_BOOK_PRESSED = 4;
var dataRequest, urlRequestAddOrEditBook, typeRequest, bookIdEdit;        

function onClickEditButton(bookId){
    $("#form-title").text("Edit book");
    $("#btn-action").val("Update");
    bookIdEdit = bookId;

    for(var bookIndex = 0; bookIndex < bookList.length; bookIndex++){
        if(bookList[bookIndex].id === bookId){
            $("#title").val(bookList[bookIndex].title);
            $("#author").val(bookList[bookIndex].author);
            $("#description").val(bookList[bookIndex].description);
            break;
        }
    }         

    state = BTN_EDIT_BOOK_PRESSED;
}

$("#btn-add").click( function (event) {
   $("#form-title").text("Create a new book");
   $("#btn-action").val("Create");
   state = BTN_ADD_BOOK_PRESSED;

   clearBookForm();
});

// code to submit book-form
$("#book-form").submit(function(event) {
    event.preventDefault();

    dataRequest = JSON.stringify({
        "title" : this.title.value,
        "author" : this.author.value,
        "description" : this.description.value
    });

    switch(state){
        case BTN_ADD_BOOK_PRESSED : {
            urlRequestAddOrEditBook = window.location.origin + "/api/book";
            typeRequest = "POST";
        }
        break;

        case BTN_EDIT_BOOK_PRESSED : {
            urlRequestAddOrEditBook = window.location.origin + "/api/book/" + bookIdEdit;
            typeRequest = "PUT";
        }
        break;
    }
    
    if($("#book-form").valid()){
        $.ajax({
            type : typeRequest,
            contentType: "application/json",
            url: urlRequestAddOrEditBook,
            data: dataRequest,
            dataType: 'json',
            timeout: 10000,
            success: function (dataReceive) {
                switch(state){
                    case BTN_ADD_BOOK_PRESSED : {
                        bookList.push(dataReceive.object);
                        showABookResult(dataReceive.object);
                    }
                    break;

                    case BTN_EDIT_BOOK_PRESSED : {
                        $("#title-" + dataReceive.object.id).text(dataReceive.object.title);
                        $("#author-" + dataReceive.object.id).text(dataReceive.object.author);

                        for(var bookIndex = 0; bookIndex < bookList.length; bookIndex++){
                            if(bookList[bookIndex].id === dataReceive.object.id){
                                bookList[bookIndex].title = dataReceive.object.title;
                                bookList[bookIndex].author = dataReceive.object.author;
                                bookList[bookIndex].description = dataReceive.object.description;
                            }
                        }
                    }
                    break;
                }
            },
            error: function (e) {
                console.log("ERROR : " + dataReceive);
            }
        });
    }
});

// validate book-form
$(document).ready(function(s) {
    $("#book-form").validate({
        rules:{
            title : {
                required: true
            },
            author: {
                required: true
            }
        },
        messages :{
            title : {
                required: "Title is not empty"
            },
            author: {
                required: "Author is not empty"
            }
        }
    });
});

// code to search all books when website is loaded complete   
document.addEventListener("DOMContentLoaded", function(){
    searchBooks("");
});

var commentsList;

function onClickLinkBook(bookId)
{
    for(var bookIndex = 0; bookIndex < bookList.length; bookIndex++){
        if(bookList[bookIndex].id === bookId){
            break;
        }
    }

    bookIdClicked = bookId;

    $("#titleBookView").text(bookList[bookIndex].title);
    $("#authorBookView").text(bookList[bookIndex].author);
    $("#descriptionBookView").text(bookList[bookIndex].description);

    $("#comments-list").empty();
    callGetAllComments(bookId);     
}

function addComment(comment){
    div_comment = document.getElementById("comments-list"); 

    div_row_add_comment = document.createElement("div");
    div_row_add_comment.className = "row";
    div_comment.appendChild(div_row_add_comment);

    div_col_lg_1 = document.createElement("div");
    div_col_lg_1.className = "col-lg-1";
    div_col_lg_1.innerText = "ava";
    div_row_add_comment.appendChild(div_col_lg_1);

    div_col_lg_11 = document.createElement("div");
    div_col_lg_11.className = "col-lg-11";
    div_row_add_comment.appendChild(div_col_lg_11);

    div_header_comment = document.createElement("div");
    div_header_comment.className = "header-comment";
    div_header_comment.style = "display : inline;";
    div_col_lg_11.appendChild(div_header_comment);

    h6_header_comment_h6 = document.createElement("h6");
    h6_header_comment_h6.className = "header-comment-h6";
    div_header_comment.appendChild(h6_header_comment_h6);

    a_name = document.createElement("a");
    a_name.className = "name";
    a_name.href = "";
    a_name.innerText = comment.user.firstName + " " + comment.user.lastName;
    h6_header_comment_h6.appendChild(a_name);

    h4_message = document.createElement("h4");
    h4_message.className = "message";
    h4_message.innerText = comment.message;
    div_col_lg_11.appendChild(h4_message);

    hr = document.createElement("hr");
    div_col_lg_11.appendChild(hr);

}

function callGetAllComments(bookId){

    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: window.location.origin + "/api/book/" + bookId + "/comments",
        dataType: 'json',
        timeout: 10000,
        success: function (dataReceive) {
            commentsList = dataReceive.object;
            
            for(var index = 0; index < commentsList.length; index++){
                addComment(commentsList[index]);
            }

            console.log(commentsList);
        },
        error: function (e) {
            console.log("ERROR : ", e.responseJSON.message);
        }
    });
}   

var bookIdClicked;

$("#comment-input").keyup(function(e){

    if(e.which == 13)
    {
        if($("#comment-input").val().trim().length > 0){
            addCommentByBookId(bookIdClicked);
        }
    }

});

function addCommentByBookId(bookId){
    dataAddComment = JSON.stringify({
        "message" : $("#comment-input").val()
    });

    $.ajax({
        type : "POST",
        contentType: "application/json",
        url: window.location.origin + "/api/book/" + bookId + "/comment",
        data: dataAddComment,
        dataType: 'json',
        timeout: 10000,
        success: function (dataReceive) {
            addComment(dataReceive.object);
            $("#comment-input").val("");
        },
        error: function (e) {
            console.log("ERROR : " + dataReceive);
        }
    });
}