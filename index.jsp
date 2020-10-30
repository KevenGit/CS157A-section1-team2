<jsp:include page="header.html"/>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Online Flea Market</title>
    <script>
        var regionMap = {"city of san francisco": {"id":"1","name":"city of san francisco","short_name":"sfc"},"south bay area": {"id":"2","name":"south bay area","short_name":"sby"},"east bay area": {"id":"3","name":"east bay area","short_name":"eby"},"peninsula": {"id":"4","name":"peninsula","short_name":"pen"},"north bay / marin": {"id":"5","name":"north bay / marin","short_name":"nby"},"santa cruz co": {"id":"6","name":"santa cruz co","short_name":"scz"},};
        var locationMap = {"1": [{"id":"1","region_id":"1","name":"alamo square / nopa","short_name":""},{"id":"2","region_id":"1","name":"bayview","short_name":""},{"id":"3","region_id":"1","name":"bernal heights","short_name":""},{"id":"4","region_id":"1","name":"castro / upper market","short_name":""},{"id":"5","region_id":"1","name":"cole valley / ashbury hts","short_name":""},{"id":"6","region_id":"1","name":"downtown / civic / van ness","short_name":""},{"id":"7","region_id":"1","name":"excelsior / outer mission","short_name":""},{"id":"8","region_id":"1","name":"financial district","short_name":""},{"id":"9","region_id":"1","name":"glen park","short_name":""},{"id":"10","region_id":"1","name":"haight ashbury","short_name":""},{"id":"11","region_id":"1","name":"hayes valley","short_name":""},{"id":"12","region_id":"1","name":"ingleside / SFSU / CCSF","short_name":""},{"id":"13","region_id":"1","name":"inner richmond","short_name":""},{"id":"14","region_id":"1","name":"inner sunset / UCSF","short_name":""},{"id":"15","region_id":"1","name":"laurel hts / presidio","short_name":""},{"id":"16","region_id":"1","name":"lower haight","short_name":""},{"id":"17","region_id":"1","name":"lower nob hill","short_name":""},{"id":"18","region_id":"1","name":"lower pac hts","short_name":""},{"id":"19","region_id":"1","name":"marina / cow hollow","short_name":""},{"id":"20","region_id":"1","name":"mission district","short_name":""},{"id":"21","region_id":"1","name":"nob hill","short_name":""},{"id":"22","region_id":"1","name":"noe valley","short_name":""},{"id":"23","region_id":"1","name":"north beach / telegraph hill","short_name":""},{"id":"24","region_id":"1","name":"pacific heights","short_name":""},{"id":"25","region_id":"1","name":"portola district","short_name":""},{"id":"26","region_id":"1","name":"potrero hill","short_name":""},{"id":"27","region_id":"1","name":"richmond / seacliff","short_name":""},{"id":"28","region_id":"1","name":"russian hill","short_name":""},{"id":"29","region_id":"1","name":"SOMA / south beach","short_name":""},{"id":"30","region_id":"1","name":"sunset / parkside","short_name":""},{"id":"31","region_id":"1","name":"tenderloin","short_name":""},{"id":"32","region_id":"1","name":"treasure island","short_name":""},{"id":"33","region_id":"1","name":"twin peaks / diamond hts","short_name":""},{"id":"34","region_id":"1","name":"USF / panhandle","short_name":""},{"id":"35","region_id":"1","name":"visitacion valley","short_name":""},{"id":"36","region_id":"1","name":"west portal / forest hill","short_name":""},{"id":"37","region_id":"1","name":"western addition","short_name":""},],"2": [{"id":"38","region_id":"2","name":"campbell","short_name":""},{"id":"39","region_id":"2","name":"cupertino","short_name":""},{"id":"40","region_id":"2","name":"gilroy","short_name":""},{"id":"41","region_id":"2","name":"hollister","short_name":""},{"id":"42","region_id":"2","name":"los gatos","short_name":""},{"id":"43","region_id":"2","name":"milpitas","short_name":""},{"id":"44","region_id":"2","name":"morgan hill","short_name":""},{"id":"45","region_id":"2","name":"mountain view","short_name":""},{"id":"46","region_id":"2","name":"san jose downtown","short_name":""},{"id":"47","region_id":"2","name":"san jose east","short_name":""},{"id":"48","region_id":"2","name":"san jose north","short_name":""},{"id":"49","region_id":"2","name":"san jose south","short_name":""},{"id":"50","region_id":"2","name":"san jose west","short_name":""},{"id":"51","region_id":"2","name":"santa clara","short_name":""},{"id":"52","region_id":"2","name":"saratoga","short_name":""},{"id":"53","region_id":"2","name":"sunnyvale","short_name":""},{"id":"54","region_id":"2","name":"willow glen / cambrian","short_name":""},],"3": [{"id":"55","region_id":"3","name":"alameda","short_name":""},{"id":"56","region_id":"3","name":"albany / el cerrito","short_name":""},{"id":"57","region_id":"3","name":"berkeley","short_name":""},{"id":"58","region_id":"3","name":"berkeley north / hills","short_name":""},{"id":"59","region_id":"3","name":"brentwood / oakley","short_name":""},{"id":"60","region_id":"3","name":"concord / pleasant hill / martinez","short_name":""},{"id":"61","region_id":"3","name":"danville / san ramon","short_name":""},{"id":"62","region_id":"3","name":"dublin / pleasanton / livermore","short_name":""},{"id":"63","region_id":"3","name":"emeryville","short_name":""},{"id":"64","region_id":"3","name":"fairfield / vacaville","short_name":""},{"id":"65","region_id":"3","name":"fremont / union city / newark","short_name":""},{"id":"66","region_id":"3","name":"hayward / castro valley","short_name":""},{"id":"67","region_id":"3","name":"hercules, pinole, san pablo, el sob","short_name":""},{"id":"68","region_id":"3","name":"lafayette / orinda / moraga","short_name":""},{"id":"69","region_id":"3","name":"oakland downtown","short_name":""},{"id":"70","region_id":"3","name":"oakland east","short_name":""},{"id":"71","region_id":"3","name":"oakland hills / mills","short_name":""},{"id":"72","region_id":"3","name":"oakland lake merritt / grand","short_name":""},{"id":"73","region_id":"3","name":"oakland north / temescal","short_name":""},{"id":"74","region_id":"3","name":"oakland piedmont / montclair","short_name":""},{"id":"75","region_id":"3","name":"oakland rockridge / claremont","short_name":""},{"id":"76","region_id":"3","name":"oakland west","short_name":""},{"id":"77","region_id":"3","name":"pittsburg / antioch","short_name":""},{"id":"78","region_id":"3","name":"richmond / point / annex","short_name":""},{"id":"79","region_id":"3","name":"san leandro","short_name":""},{"id":"80","region_id":"3","name":"vallejo / benicia","short_name":""},{"id":"81","region_id":"3","name":"walnut creek","short_name":""},],"4": [{"id":"82","region_id":"4","name":"atherton","short_name":""},{"id":"83","region_id":"4","name":"belmont","short_name":""},{"id":"84","region_id":"4","name":"brisbane","short_name":""},{"id":"85","region_id":"4","name":"burlingame","short_name":""},{"id":"86","region_id":"4","name":"coastside/pescadero","short_name":""},{"id":"87","region_id":"4","name":"daly city","short_name":""},{"id":"88","region_id":"4","name":"east palo alto","short_name":""},{"id":"89","region_id":"4","name":"foster city","short_name":""},{"id":"90","region_id":"4","name":"half moon bay","short_name":""},{"id":"91","region_id":"4","name":"los altos","short_name":""},{"id":"92","region_id":"4","name":"menlo park","short_name":""},{"id":"93","region_id":"4","name":"millbrae","short_name":""},{"id":"94","region_id":"4","name":"mountain view","short_name":""},{"id":"95","region_id":"4","name":"pacifica","short_name":""},{"id":"96","region_id":"4","name":"palo alto","short_name":""},{"id":"97","region_id":"4","name":"portola valley","short_name":""},{"id":"98","region_id":"4","name":"redwood city","short_name":""},{"id":"99","region_id":"4","name":"redwood shores","short_name":""},{"id":"100","region_id":"4","name":"san bruno","short_name":""},{"id":"101","region_id":"4","name":"san carlos","short_name":""},{"id":"102","region_id":"4","name":"san mateo","short_name":""},{"id":"103","region_id":"4","name":"south san francisco","short_name":""},{"id":"104","region_id":"4","name":"woodside","short_name":""},],"5": [{"id":"105","region_id":"5","name":"corte madera","short_name":""},{"id":"106","region_id":"5","name":"fairfax","short_name":""},{"id":"107","region_id":"5","name":"greenbrae","short_name":""},{"id":"108","region_id":"5","name":"healdsburg / windsor","short_name":""},{"id":"109","region_id":"5","name":"kentfield / ross","short_name":""},{"id":"110","region_id":"5","name":"lake county","short_name":""},{"id":"111","region_id":"5","name":"larkspur","short_name":""},{"id":"112","region_id":"5","name":"mendocino county","short_name":""},{"id":"113","region_id":"5","name":"mill valley","short_name":""},{"id":"114","region_id":"5","name":"napa county","short_name":""},{"id":"115","region_id":"5","name":"novato","short_name":""},{"id":"116","region_id":"5","name":"petaluma","short_name":""},{"id":"117","region_id":"5","name":"rohnert pk / cotati","short_name":""},{"id":"118","region_id":"5","name":"russian river","short_name":""},{"id":"119","region_id":"5","name":"san anselmo","short_name":""},{"id":"120","region_id":"5","name":"san rafael","short_name":""},{"id":"121","region_id":"5","name":"santa rosa","short_name":""},{"id":"122","region_id":"5","name":"sausalito","short_name":""},{"id":"123","region_id":"5","name":"sebastopol","short_name":""},{"id":"124","region_id":"5","name":"sonoma","short_name":""},{"id":"125","region_id":"5","name":"tiburon / belvedere","short_name":""},{"id":"126","region_id":"5","name":"west marin","short_name":""},],"6": [{"id":"127","region_id":"6","name":"aptos","short_name":""},{"id":"128","region_id":"6","name":"boulder creek","short_name":""},{"id":"129","region_id":"6","name":"capitola","short_name":""},{"id":"130","region_id":"6","name":"santa cruz","short_name":""},{"id":"131","region_id":"6","name":"scotts valley","short_name":""},{"id":"132","region_id":"6","name":"soquel","short_name":""},{"id":"133","region_id":"6","name":"watsonville","short_name":""},],};
        var categoryMap = {"antiques": {"id":"1","name":"antiques","short_name":"atq"},"appliances": {"id":"2","name":"appliances","short_name":"app"},"arts+crafts": {"id":"3","name":"arts+crafts","short_name":"art"},"atv/utv/sno": {"id":"4","name":"atv/utv/sno","short_name":"snw"},"auto parts": {"id":"5","name":"auto parts","short_name":"pts"},"aviation": {"id":"6","name":"aviation","short_name":"avo"},"baby+kid": {"id":"7","name":"baby+kid","short_name":"bab"},"barter": {"id":"8","name":"barter","short_name":"bar"},"beauty+health": {"id":"9","name":"beauty+health","short_name":"hab"},"bike parts": {"id":"10","name":"bike parts","short_name":"bop"},"bikes": {"id":"11","name":"bikes","short_name":"bik"},"boat parts": {"id":"12","name":"boat parts","short_name":"bpo"},"boats": {"id":"13","name":"boats","short_name":"boa"},"books": {"id":"14","name":"books","short_name":"bks"},"business": {"id":"15","name":"business","short_name":"bfs"},"cars+trucks": {"id":"16","name":"cars+trucks","short_name":"ctd"},"cds/dvd/vhs": {"id":"17","name":"cds/dvd/vhs","short_name":"emd"},"cell phones": {"id":"18","name":"cell phones","short_name":"mob"},"clothes+acc": {"id":"19","name":"clothes+acc","short_name":"clo"},"collectibles": {"id":"20","name":"collectibles","short_name":"clt"},"computer parts": {"id":"21","name":"computer parts","short_name":"sop"},"computers": {"id":"22","name":"computers","short_name":"sys"},"electronics": {"id":"23","name":"electronics","short_name":"ele"},"farm+garden": {"id":"24","name":"farm+garden","short_name":"grd"},"free": {"id":"25","name":"free","short_name":"zip"},"furniture": {"id":"26","name":"furniture","short_name":"fuo"},"garage sale": {"id":"27","name":"garage sale","short_name":"gms"},"general": {"id":"28","name":"general","short_name":"for"},"heavy equip": {"id":"29","name":"heavy equip","short_name":"hvo"},"household": {"id":"30","name":"household","short_name":"hsh"},"jewelry": {"id":"31","name":"jewelry","short_name":"jwl"},"materials": {"id":"32","name":"materials","short_name":"mat"},"motorcycle parts": {"id":"33","name":"motorcycle parts","short_name":"mpo"},"motorcycles": {"id":"34","name":"motorcycles","short_name":"mcy"},"music instr": {"id":"35","name":"music instr","short_name":"msg"},"photo+video": {"id":"36","name":"photo+video","short_name":"pho"},"rvs+camp": {"id":"37","name":"rvs+camp","short_name":"rvs"},"sporting": {"id":"38","name":"sporting","short_name":"spo"},"tickets": {"id":"39","name":"tickets","short_name":"tix"},"tools": {"id":"40","name":"tools","short_name":"tls"},"toys+games": {"id":"41","name":"toys+games","short_name":"tag"},"trailers": {"id":"42","name":"trailers","short_name":"tro"},"video gaming": {"id":"43","name":"video gaming","short_name":"vgm"},"wanted": {"id":"44","name":"wanted","short_name":"wan"},"wheels+tires": {"id":"45","name":"wheels+tires","short_name":"wto"},};
        window.onload = function() {
            var regionSel = document.getElementById("region");
            var locationSel = document.getElementById("location");
            var categorySel = document.getElementById("category");
            // add regions to the selector
            for (var x in regionMap) {
                regionSel.options[regionSel.options.length] = new Option(x, JSON.stringify(regionMap[x]));
            }
            // add categories to the selector
            for (var y in categoryMap) {
                categorySel.options[categorySel.options.length] = new Option(y, JSON.stringify(categoryMap[y]));
            }
            // update location selector upon changing region:
            regionSel.onchange = function() {
                var jsonVal = JSON.parse(this.value);
                var region_id = jsonVal["id"];
                //clear locations of previously selected region (options from 1 to length-1)
                var length = locationSel.options.length;
                for (i = length-1; i > 0; i--) {
                    locationSel.options[i] = null;
                }
                //add locations of newly selected region
                for (var y in locationMap[region_id]) {
                    // y is the index starting from 0 to (locationMap[region_id].length - 1)
                    // locationMap[region_id][y]["name"] is the name field of the y-th entry
                    locationSel.options[locationSel.options.length] = new Option(locationMap[region_id][y]["name"], JSON.stringify(locationMap[region_id][y]));
                }
            }
        }
    </script>
</head>
<body class="post new-form">
    <section class="body">
        <form id="postingForm"
              action="processPosting.jsp" method="post">
            <table border="0" align="center">
                <tr><td>Region</td><td>Location</td><td>Category</td></tr>
                <tr><td><select name="region" id="region"><option value="" selected="selected">Select a region</option></select>&nbsp;</td>
                    <td><select name="location" id="location"><option value="" selected="selected">Please select a region first</option></select>&nbsp;</td>
                    <td><select name="category" id="category"><option value="" selected="selected">Please select a category</option></select>&nbsp;</td>
                </tr>
                <tr><td>Condition</td><td>Make</td><td>Model</td></tr>
                <tr>
                    <td><input type="text" name="condition" value="" maxlength="30" size="33%"/></td>
                    <td><input type="text" name="make" value="" maxlength="30" size="33%" /></td>
                    <td><input type="text" name="model" value="" maxlength="30" size="33%" /></td>
                </tr>
                <tr><td align="left">Search for sale</td>
                    <td colspan="2" align="left"><input type="checkbox" value="">Title only &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Price $<input type="number" name="priceFrom" value="" maxlength="11" size="10%"/> to <input type="number" name="priceTo" value="" maxlength="11" size="10%"/></td>
                </tr>
                <tr>
                    <td colspan="3"><input name="searchText" value="" type="text" autofocus="autofocus" id="searchText" size="100%"/> <input type="submit" value="GO"></td>
                </tr>
            </table>
        </form>
    </section>
</body>
</html>
<jsp:include page="footer.html"/>