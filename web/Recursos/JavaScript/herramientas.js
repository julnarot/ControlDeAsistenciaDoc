function buscarAutocompleteReziseLp1(objText, objUrl,ObjZise ){           
           $('#'+objText).autocomplete(objUrl, {
            width: ObjZise+"px",
            minChars: 1
            //delay: 400
        }).result(function(event,data) {
        });
    }