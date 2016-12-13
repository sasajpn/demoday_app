$(document).on 'ready page:load', ->
  $('#address_postal_code').keydown ->
    presskey = String.fromCharCode(event.keyCode);
    event.returnValue = /[0-9\b\t\n]/.test(presskey)
  $('#getarea-button').click ->
    postalcode = $('#address_postal_code').val()
    if postalcode.length != 7
      $('#postalcode-result').css({ "color": "#FF0000", "font-weight": "bold" }).html("郵便番号は7桁で入力してください")
      return false
    $.ajax
      async:    true
      url:      "/users/get_area/"
      type:     "GET"
      data:     { search_code: postalcode }
      dataType: "json"
      context:  this
      error: (jqXHR, textStatus, errorThrown) ->
        $('#postalcode-result').css({ "color": "#D3D3D3", "font-weight": "bold" }).html(errorThrown)
      success: (data, textStatus, jqXHR) ->
        if data?
          $('#address_prefecture').val(data.prefecture_id)
          $('#address_municipality').val(data.municipality)
          $('#address_street').val(data.street)
        else
          $('#postalcode-result').css({ "color": "#FF0000", "font-weight": "bold", "font-size": "14px" }).html("その郵便番号は登録されていません")

$('.address').change -> $('#postalcode-result').html("")
