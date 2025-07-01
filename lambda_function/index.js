exports.handler = async (event) => {
    console.log('Event received:', JSON.stringify(event));
    
    let body;
    let statusCode = 200;
    const headers = {
        'Content-Type': 'application/json',
    };
    
    try {

        if (event.body) {
            body = JSON.parse(event.body);
        } else {
            body = event;
        }
        
        const httpMethod = event.httpMethod || event.requestContext?.http?.method || 'GET';
        
        const path = event.path || event.rawPath || '/';
        
        let response = {
            message: 'Hello from Lambda!'
        };
        
        if (path.includes('/items')) {
            if (httpMethod === 'GET') {
                response = {
                    message: 'This is a GET request to /items',
                    items: [
                        { id: 1, name: 'Item 1' },
                        { id: 2, name: 'Item 2' },
                        { id: 3, name: 'Item 3' }
                    ]
                };
            } else if (httpMethod === 'POST') {
                response = {
                    message: 'Item created successfully',
                    item: body
                };
            }
        } else if (path.includes('/status')) {
            response = {
                status: 'OK',
                timestamp: new Date().toISOString()
            };
        }
        
        body = response;
    } catch (err) {
        statusCode = 400;
        body = { error: err.message };
    }
    
    return {
        statusCode,
        body: JSON.stringify(body),
        headers,
    };
};
