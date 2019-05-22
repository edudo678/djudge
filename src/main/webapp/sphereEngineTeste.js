function initExec() {

    $.getJSON("https://a53fdb4d.compilers.sphere-engine.com/api/v4/submissions/82806075?access_token=8bce219ca0c54390d6b832fa542470b2", 
    function (response, body) {
        console.log(JSON.parse(response.body));
    }
    );
    
}