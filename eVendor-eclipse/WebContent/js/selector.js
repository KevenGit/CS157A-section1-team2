var regions = ["Alabama", "Alaska", "Arizona",
	"Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
	"Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
	"New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
	"South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"];
var categories = ["antiques","appliances","arts+crafts","atv/utv/sno","auto parts","aviation","baby+kid","barter"
,"beauty+health","bike parts","bikes","boat parts","boats","books","business","cars+trucks","cds/dvd/vhs"
,"cell phones","clothes+acc","collectibles","computer parts","computers","electronics","farm+garden", "food"
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