Parse.Cloud.define("hello", (request) => {
    console.log("Hello from Cloud Code!");
    return "Nelton Menata - O Programador";
});

Parse.Cloud.define("soma", async (request) => {

    return request.params.num1 + request.params.num2;

});