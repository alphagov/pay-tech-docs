# Troubleshooting

This section explains how to troubleshoot common problems.

## Code P0920 errors

**Problem**: Some calls you make to the API receive a 400 Bad Request response, with this error in the response body:

```javascript
{
  "code": "P0920",
  "description": "Request blocked by security rules. Please consult API documentation for more information."
}
```

**Fix**: This response means that your API call was blocked by our firewalls. Check that the API call you sent was correctly formed.

Possible reasons why your call may be rejected include:

+ sending a POST call with an empty body where content in the body is expected
+ the use of invalid characters such as ``<``, ``>``, ``|``, ``"`` or backslashes
+ the ``return_url`` you provide is not ``https://``
+ there are URLs inside the ``reference`` or ``description`` you provide


## The code examples in the documentation do not work

**Problem**: The "Example Request" code snippets in the API documentation always cause the request to fail with a "401 unauthorized" error.

**Fix**: Remember that you must send the API key with "Bearer " in front of it (not including the quotation marks.) This is not made clear in the code examples due to a technical limitation.

If the code example includes a line like this:

```ruby
request["authorization"] = 'YOUR API KEY HERE'
```

remember that you must actually use "Bearer <YOUR API KEY>" as the value.
