# connect-four-ios

# Framework Explanation

- Alamofire: 

I used Alamofire to manage network requests. While I could have achieved the same result with URLSession, Alamofire makes it easier to work with decoded responses and, thinking about the future, it also makes it much easier to send encoded parameters in a request.
I decided to trade control for ease of use. But nonetheless, all depencies with Alamofire are centralized in a single class and I could make the change to URLSession without having to change any other class.

- Lottie:

I used Lottie for animations. I wanted to add a loader to notify the user that they have to wait and Lottie makes it really easy to add animations into the app. Moreover there are a lot of free animations to use in their website.
