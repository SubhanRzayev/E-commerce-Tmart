// Index page filter

$('.sortsby').change(function(e){
    $('#filterform').submit()
})

// Shop page filtes

var checkBox = document.getElementById("all");

var productListSec = document.getElementById('color-list')

filterApi = async () => {
    let response = await fetch('http://localhost:8000/api/all/')
    let productList = await response.json();

    console.log(productList);
    for (let product of productList) {
        productListSec.innerHTML += `
        <div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12" id="color-list">
        <div class="product foo">
        <div class="product__inner">
            <div class="pro__thumb">
                <a href="#">
                    <img src="${product.cover_image}" alt="product images">
                </a>
            </div>
        </div>
        <div class="product__details">
            <h2><a href="${product.get_absolute_url}">${product.title}</a></h2>    
            <ul class="product__price">
                <li class="old__price">${product.price}</li>
                <li class="new__price">${product.discount_price}</li> 
            </ul>
        </div>
        </div> 
        </div>         
    `
    }

}

checkBox.addEventListener("click", (e) =>{

    e.preventDefault()
    filterApi()
    let products = document.querySelectorAll(".second_filter")

    // products.forEach(a => ); 
    products.forEach((products) => { products.hidden = true; } );

})

// *********************************************************************************

var latest_filter = document.getElementById("latest");


var productListThird = document.getElementById('color-list')

filterApiSecond = async () => {
    let response = await fetch('http://localhost:8000/api/latest/')
    let productList = await response.json();

    console.log(productList);
    for (let product of productList) {
        // if(product.discount_price )
        productListThird.innerHTML += `
        <div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12" id="color-list">
        <div class="product foo">
        <div class="product__inner">
            <div class="pro__thumb">
                <a href="#">
                    <img src="${product.cover_image}" alt="product images">
                </a>
            </div>
        </div>
        <div class="product__details">
            <h2><a href="${product.get_absolute_url}">${product.title}</a></h2>    
            <ul class="product__price">
                <li class="old__price">${product.price}</li>
                <li class="new__price">${product.discount_price}</li> 
            </ul>
        </div>
        </div> 
        </div>         
    `
    }

}

latest_filter.addEventListener("click", (e) =>{

    e.preventDefault()
    filterApiSecond()
    let products_2 = document.querySelectorAll(".second_filter")

    // products.forEach(a => ); 
    products_2.forEach((products_2) => { products_2.hidden = true; } );

})

// *********************************************************************************

var sale_filter = document.getElementById("sale");


var productListFourth = document.getElementById('color-list')

filterApiThird = async () => {
    let response = await fetch('http://localhost:8000/api/sale/')
    let productList = await response.json();

    console.log(productList);
    for (let product of productList) {
        productListFourth.innerHTML += `
        <div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12" id="color-list">
        <div class="product foo">
        <div class="product__inner">
            <div class="pro__thumb">
                <a href="#">
                    <img src="${product.cover_image}" alt="product images">
                </a>
            </div>
        </div>
        <div class="product__details">
            <h2><a href="${product.get_absolute_url}">${product.title}</a></h2>    
            <ul class="product__price">
                <li class="old__price">${product.price}</li>
                <li class="new__price">${product.discount_price}</li> 
            </ul>
        </div>
        </div> 
        </div>         
    `
    }

}

sale_filter.addEventListener("click", (e) =>{

    e.preventDefault()
    filterApiThird()
    let products_3 = document.querySelectorAll(".second_filter")

    // products.forEach(a => ); 
    products_3.forEach((products_3) => { products_3.hidden = true; } );

})