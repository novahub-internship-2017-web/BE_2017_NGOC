<%@ page import="com.ngoc.bookmanagement.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <meta charset="UTF-8"/>
    <style>
        .container{
            margin-top: 100px;
        }
    </style>
</head>
<body style="background-color: #E0E0E0">

<%@ include file="_header.jsp"%>
<%
    String wordsSearch = (String) request.getAttribute(Constant.wordsSearch);

    wordsSearch = (wordsSearch == null) ? "" : wordsSearch;
%>
<%
    List<Book> bookList = (List<Book>) request.getAttribute(Constant.bookListAttribute);
    Book book;
    long id = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();
%>

<div class="row mb-1" style="margin-top: 100px">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <form action="" method="post" name="bookSearchForm">
            <div class="col-auto">
                <label class="sr-only" for="inlineFormInputGroup">Username</label>
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fa fa-search"></i> </div>
                    </div>
                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Search" name="<%=Constant.wordsSearch%>" value="<%=wordsSearch%>">
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-2"></div>
</div>


<div class="container body" >
</div>


<%@ include file="_footer.jsp"%>
<script>
    function showMenu(event, element) {
        var bookTitle = element.getAttribute("bookTitle");
        if (!confirm("Do you want to delete book '" + bookTitle + "' ?")) {
            event.preventDefault();
        }
    }
</script>

<script type="text/javascript">
    $(function() {
        /*  Submit form using Ajax */
        $('input[name=<%=Constant.wordsSearch%>]').click(function(e) {

            //Prevent default submission of form
            e.preventDefault();

            $.post({
                url : 'bookList',
                data : $('form[name=bookSearchForm]').serialize(),
                success : function(res) {
                    console.log("SUCCESS: ", res);
                    $(".body").empty();
                    $.each(res, function() {
                        var div_row_md_1 = document.createElement('div');
                        div_row_md_1.className = 'row mb-1';

                            var div_col_md_2 = document.createElement('div');
                            div_col_md_2.className = 'col-md-2';
                            div_row_md_1.append(div_col_md_2);

                            var div_col_md_8 = document.createElement('div');
                            div_col_md_8.className = 'col-md-8';
                            div_row_md_1.append(div_col_md_8);

                            var div_card_flex_md_row_mb_4_box_shadow_h_md_300 = document.createElement('div');
                            div_card_flex_md_row_mb_4_box_shadow_h_md_300.className = 'card flex-md-row mb-4 box-shadow h-md-300';
                            div_col_md_8.append(div_card_flex_md_row_mb_4_box_shadow_h_md_300);

                            var div_card_body_align_items_start = document.createElement('div');
                            div_card_body_align_items_start.className = 'card-body align-items-start';
                            div_card_body_align_items_start.style = 'position: relative';
                            div_card_flex_md_row_mb_4_box_shadow_h_md_300.appendChild(div_card_body_align_items_start);

                            var image_bookCoverImage = document.createElement('img');
                            image_bookCoverImage.id = 'bookCoverImage';
                            if(this.bookCover.url == null) {
                                image_bookCoverImage.setAttribute('src', '/book-covers/no-image.jpg');
                            }else {
                                image_bookCoverImage.setAttribute('src', this.bookCover.url);
                            }
                            image_bookCoverImage.className = 'h3 mb-3 pull-left';
                            image_bookCoverImage.style = 'border-radius: 50%; margin-right: 30px; width: 200px; height: 200px; border: 1px solid black;';
                            div_card_body_align_items_start.append(image_bookCoverImage);

                            var h3_mb_0 = document.createElement('h3');
                            h3_mb_0.className = 'mb-0';
                            div_card_body_align_items_start.append(h3_mb_0);

                            var a_card_title = document.createElement('a');
                            a_card_title.className = 'card-title';
                            a_card_title.href = '/book/' + this.id;
                            a_card_title.innerHTML = this.title;
                            h3_mb_0.append(a_card_title);

                            var div_card_subtitle_mb_1_text_muted = document.createElement('div');
                            div_card_subtitle_mb_1_text_muted.className = 'card-subtitle mb-1 text-muted';
                            div_card_subtitle_mb_1_text_muted.innerHTML = this.author;
                            div_card_body_align_items_start.append(div_card_subtitle_mb_1_text_muted);

                            var div_card_text = document.createElement('div');
                            div_card_text.style = 'word-wrap: break-word';
                            div_card_body_align_items_start.append(div_card_text);

                            var p_card_text = document.createElement('p');
                            p_card_text.className = 'card-text';
                            p_card_text.style = 'word-break: break-all;';
                            p_card_text.innerHTML = this.description.substring(0, (this.description.length > 250) ? 250 : this.description.length);
                            div_card_text.append(p_card_text);

                            var div_control_buttons = document.createElement('div');
                            div_control_buttons.className = 'pull-right';
                            div_card_body_align_items_start.append(div_control_buttons);

                            var a_edit_button = document.createElement('a');
                            a_edit_button.className = 'btn btn-primary';
                            a_edit_button.href = '/book/' + this.id + '/edit';
                            a_edit_button.innerHTML = 'Edit';
                            div_control_buttons.append(a_edit_button);

                            var a_delete_button = document.createElement('a');
                            a_delete_button.className = 'btn btn-danger deleteBook';
                            a_delete_button.href = '/book/' + this.id + '/delete';
                            a_delete_button.style = 'margin-left: 10px';
                            a_delete_button.setAttribute('onclick', 'showMenu(event, this)');
                            a_delete_button.setAttribute('bookTitle', this.title);
                            a_delete_button.innerHTML = 'Delete';
                            div_control_buttons.append(a_delete_button);

                            div_col_md_2 = document.createElement('div');
                            div_col_md_2.className = 'col-md-2';
                            div_row_md_1.append(div_col_md_2);

                        $(".body").append(div_row_md_1);
                    });
                }
            })
        });
    });
</script>

</body>
</html>
