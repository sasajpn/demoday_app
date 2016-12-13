$(document).on 'ready page:load', ->
  $('#address_postal_code').keydown ->
    presskey = String.fromCharCode(event.keyCode);
    event.returnValue = /[0-9\b\t\n]/.test(presskey)
  $('#getarea-button').click ->
    postalcode = $('#address_postal_code').val()
    if postalcode.length != 7
      $('#postalcode-result').css("color", "#ff0000").html("郵便番号は7桁です.")
      return false
    $.ajax
      async:    true
      url:      "/users/get_area/"
      type:     "GET"
      data:     { search_code: postalcode }
      dataType: "json"
      context:  this
      error: (jqXHR, textStatus, errorThrown) ->
        $('#postalcode-result').css("color", "#ff0000").html(errorThrown)
      success: (data, textStatus, jqXHR) ->
        if data?
          $('#address_prefecture').val(data.prefecture_id)
          $('#address_municipality').val(data.municipality)
          $('#address_street').val(data.street)
          $('#postalcode-result').css("color", "#00dd00").html("入力が完了しました。")
        else
          $('#postalcode-result').css("color", "#ff0000").html("未登録の郵便番号です。")

$('.address').change -> $('#postalcode-result').html("")
