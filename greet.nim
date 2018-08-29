import  httpclient # declaration to use the http client 
import asyncdispatch # declaration to use the async functionality 

#To call the async version of the client we need to wrap the code in an async proc 
# we do this by appending {.async.} to the end of the proc. The proc can only return
# type Future[T] (similar to c# Task<T> for async functions)
proc getRequest (url:string): Future[string]{.async.}  =
    var client = newAsyncHttpClient()
    return await client.getContent(url)   

# Since this is async we can assign the future and carry on with other things the program needs to do.
var Futureresponse = getRequest("http://google.com")
echo "wating ..."
# the waitFor function blocks the thred untill the Future is finished. 
var response = waitFor Futureresponse
echo response