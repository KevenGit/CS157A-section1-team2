var regions = ["city of san francisco", "south bay area", "east bay area", "peninsula", "north bay / marin", "santa cruz co"];
var categories = ["antiques","appliances","arts+crafts","atv/utv/sno","auto parts","aviation","baby+kid","barter"
,"beauty+health","bike parts","bikes","boat parts","boats","books","business","cars+trucks","cds/dvd/vhs"
,"cell phones","clothes+acc","collectibles","computer parts","computers","electronics","farm+garden"
,"free","furniture","garage sale","general","heavy equip","household","jewelry","materials","motorcycle parts"
,"motorcycles","music instr","photo+video","rvs+camp","sporting","tickets","tools","toys+games","trailers","video gaming"
,"wanted","wheels+tires", "other"];
window.onload = function() {
    var regionSel = document.getElementById("region");
    var categorySel = document.getElementById("category");
    
    // add regions to the selector
    for (var x in regions) {
        regionSel.options[regionSel.options.length] = new Option(regions[x], regions[x]);
    }
    // add categories to the selector
    for (var y in categories) {
        categorySel.options[categorySel.options.length] = new Option(categories[y], categories[y]);
    }
}