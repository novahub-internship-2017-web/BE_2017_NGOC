<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
    <head>
        <title>Book New</title>
    </head>
    <body style="background-color: #E0E0E0">

        <%
            String title = "Create New Book";
        %>

        <%@ include file="_header.jsp"%>

        <%@ include file="_book.jsp"%>

        <div class="book-new">

        </div>

        <%@ include file="_footer.jsp"%>

        <script type="text/javascript">
            $(function() {
                /*  Submit form using Ajax */
                $('input[name=submit]').click(function(e) {

                    //Prevent default submission of form
                    e.preventDefault();

                    var form = $('#form-book')[0];

                    var data = new FormData(form);

                    data.append("bookCoverImage", $('#uploadImage')[0].files[0]);


                    $.ajax({
                        type: "POST",
                        enctype: 'multipart/form-data',
                        url : '/bookthu',
                        data : data,
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 600000,
                        success : function(res) {
                            console.log("SUCCESS: ", res);
                            $(".book-new").empty();

                            var div_row_md_1 = document.createElement('div');
                            div_row_md_1.className = 'row mb-1';

                            document.getElementsByClassName("book-new")[0].append(div_row_md_1);
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
                            if(res.bookCover.url == null) {
                                image_bookCoverImage.setAttribute('src', '/book-covers/no-image.jpg');
                            }else {
                                image_bookCoverImage.setAttribute('src', res.bookCover.url);
                            }
                            image_bookCoverImage.className = 'h3 mb-3 pull-left';
                            image_bookCoverImage.style = 'border-radius: 50%; margin-right: 30px; width: 200px; height: 200px; border: 1px solid black;';
                            div_card_body_align_items_start.append(image_bookCoverImage);

                            var h3_mb_0 = document.createElement('h3');
                            h3_mb_0.className = 'mb-0';
                            div_card_body_align_items_start.append(h3_mb_0);

                            var a_card_title = document.createElement('a');
                            a_card_title.className = 'card-title';
                            a_card_title.href = '/book/' + res.id;
                            a_card_title.innerHTML = res.title;
                            h3_mb_0.append(a_card_title);

                            var div_card_subtitle_mb_1_text_muted = document.createElement('div');
                            div_card_subtitle_mb_1_text_muted.className = 'card-subtitle mb-1 text-muted';
                            div_card_subtitle_mb_1_text_muted.innerHTML = res.author;
                            div_card_body_align_items_start.append(div_card_subtitle_mb_1_text_muted);

                            var div_card_text = document.createElement('div');
                            div_card_text.style = 'word-wrap: break-word';
                            div_card_body_align_items_start.append(div_card_text);

                            var p_card_text = document.createElement('p');
                            p_card_text.className = 'card-text';
                            p_card_text.style = 'word-break: break-all;';
                            p_card_text.innerHTML = res.description.substring(0, (res.description.length > 250) ? 250 : res.description.length);
                            div_card_text.append(p_card_text);

                            var div_control_buttons = document.createElement('div');
                            div_control_buttons.className = 'pull-right';
                            div_card_body_align_items_start.append(div_control_buttons);

                            var a_edit_button = document.createElement('a');
                            a_edit_button.className = 'btn btn-primary';
                            a_edit_button.href = '/book/' + res.id + '/edit';
                            a_edit_button.innerHTML = 'Edit';
                            div_control_buttons.append(a_edit_button);

                            var a_delete_button = document.createElement('a');
                            a_delete_button.className = 'btn btn-danger deleteBook';
                            a_delete_button.href = '/book/' + res.id + '/delete';
                            a_delete_button.style = 'margin-left: 10px';
                            a_delete_button.setAttribute('onclick', 'showMenu(event, this)');
                            a_delete_button.setAttribute('bookTitle', res.title);
                            a_delete_button.innerHTML = 'Delete';
                            div_control_buttons.append(a_delete_button);

                            div_col_md_2 = document.createElement('div');
                            div_col_md_2.className = 'col-md-2';
                            div_row_md_1.append(div_col_md_2);


                        }
                    })
                });
            });
        </script>

        <script src="/js/book.js"></script>
    </body>
</html>
