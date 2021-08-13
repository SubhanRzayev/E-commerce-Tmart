// let star = document.querySelector('.rating input');
// let starValue = star.value
// console.log(starValue)
// for (let i = 0; i < starValue; i++) {
    
// }
// for (let i = 0; i < starValue; i++) {
//     star[i].addEventListener('click', function() {
//         console.log("aaaaaaaaaaa")
//         i = this.value;
//     })
// }

// let hiden = document.getElementById("star0")
// console.log(hiden.value)

function firstStar() {
    let firststar = document.getElementById("star1")
    console.log(firststar.value)

    if(document.getElementById('star1').checked) {
        console.log(secondstar.value);
    }
    return firststar.value
}
function secondStar() {
    let secondstar = document.getElementById("star2")
    console.log(secondstar.value)
    return secondstar.value
}
function thirdStar() {
    let thirdtstar = document.getElementById("star3")
    console.log(thirdtstar.value)
    return thirdtstar.value
}
function forstStar() {
    let forsttstar = document.getElementById("star4")
    console.log(forsttstar.value)
    return forsttstar.value
}
function fifthStar() {
    let fifthstar = document.getElementById("star5")
    console.log(fifthstar.value)
    return fifthstar.value
}

document.querySelector('.review_class').addEventListener('click',event => {
    let a = document.querySelector('.product_id').innerText
    console.log(a)
    let form_pro_id = document.querySelector('.pro_id')
    form_pro_id.value = a
    console.log(form_pro_id, "Here")
})