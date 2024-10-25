// index.js
exports.handler = async (event) => {
    console.log("Event received: ", event);
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };
    return response;
};
