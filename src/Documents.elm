module Documents exposing
    ( data
    , Result
    )

{-|


# Queries Data

@docs data


# Result Model

@docs Result

-}


{-| This model defines the query and the result.
-}
type alias Result =
    { result : String, query : String }


{-| Here you can define all your queries and results.
-}
data : List Result
data =
    [ { result = "Sorry, there is no match to your text, please be more specific", query = "i" }
    , { result = "In order to return a product, you have to provide a good reason for that. If the product was not working from the beginning, we will accept it. If you have warranty, we will accept it. otherwise, we do not accept the returns.", query = "What is the return policy?" }
    , { result = "We can ship to any place you would like to. it may take several days, dependig on your distance.", query = "What are the shipping Options?" }
    , { result = "There is no internation tax, however, you will have to pay the local tax for buying a new product.", query = "What are the international taxes, duties, etc. that I have to pay?" }
    , { result = "when you buy things online, you will recieve your order in your mail.", query = "When will I receive my order?" }
    , { result = "You can send us the order number, and we will send you the order back to you.", query = "What do I do if I never received my order?" }
    , { result = "In that case, please contact us, or send us a mail.", query = "What do I do if I received a defective order?" }
    , { result = "You can edit your order at anytime before you proceed to pay.", query = "How do I make changes to an order I’ve already placed?" }
    , { result = "Our main brance is located in Bratislava, Twin City", query = "Where are the location of your branches?" }
    , { result = "That belongs to you. we will never gurranty that.", query = "How do I make sure I order the right size?" }
    , { result = "we are trying our best to reach to our customers, as soon as possible. but you can send us mails or call us at vvv@vvv.com and +421000000000", query = "How do I contact your company if my query isn’t resulted here?" }
    , { result = "You can track the status of your order, once it is shipped, with your tracking number.", query = "What is the status of my order? and where can i check it?" }
    , { result = "As far, as you have not paid, you can change your order.", query = "Can I change my order?" }
    , { result = "we ship to almost any part of the world.", query = "Which cities and stats are you currently shipping?" }
    , { result = "the day you buy a product, we prepare it for shipping. the next day it is shipped.", query = "How long does it take to ship my order?" }
    , { result = "We accept, VISA, G-Pay, Master Card and Cash.", query = "What payment methods do you accept?" }
    , { result = "the main currency we use here is Euro.", query = "Which currency will I be charged in?" }
    , { result = "Yes, but each fast shipping will cost you extra money.", query = "Do you offer fast shipping?" }
    , { result = "Yes. you can select the warranty when buying the product. it will cost you extra money, but has its own advantages.", query = "Will there be warranty for the item i purchase?" }
    , { result = "We have both new and old or used products. you can choose which one to buy.", query = "Are all your products new and original, or are they used?" }
    , { result = "You can cancel your order anytime, before you get the product or before it is shipped. you just have to cancel it in your cart.", query = "Is it possible for me to cancel my order and what would be the procedure of doing it?" }
    , { result = "You can buy any product from anywhere, but only to those countries, where we ship.", query = "Can I order and buy a phone from your web site from any country?" }
    , { result = "There are no hidden costs at all. you will pay what you see you should pay.", query = "Are there any additional costs other than those that I see when confirming the order?" }
    , { result = "Every new product is coming with its user manual.", query = "Can I expect to get the User manual together with the product?" }
    , { result = "If you are eligible to the installments, you can buy products by installments.", query = "Can I buy any product in installments?" }
    , { result = "Its because one is new and the other is used.", query = "Why on E-asy web site you have the same model with different prices?" }
    , { result = "Different colors cost different.", query = "Why do you have different prices for different colors of same phone on your web site?" }
    , { result = "We can deliver to any place that is listed in our shiping countries.", query = "Can you deliver in small towns and villages?" }
    , { result = "You can come personally and take your product.", query = "Can I personally come and take over my order?" }
    , { result = "If you are not satisfied with the product, you can return it before opening. we will pay you back in one month.", query = "Can I return my phone, what is the procedure and what is the time period that I can expect my money to be refunded?" }
    , { result = "You will get a new product, once you shipped back the damaged one.", query = "Package was delivered to me damaged, how can I refund my loss?" }
    , { result = "we offer different warranties for different products.", query = "Do you offer an extended warranty or a device protection plan for phones?" }
    , { result = "We do not repair products.", query = "Do you repair phones?" }
    , { result = "We sell accessories as well.", query = "Do you sell accessories?" }
    , { result = "Our privacy policy is written in the website.", query = "Where can I find your Privacy Policy?" }
    , { result = "You can send us your feedback via email.", query = "How can i send you feedback?" }
    , { result = "You can check it if you come to the store to buy it.", query = "Is it possible to check the goods before buying?" }
    , { result = "Account is not needed. but if you have one, that is good.", query = "Is it necessary to have an account to shop on E-asy?" }
    , { result = "Please see the list of gift cards in our website that we accept.", query = "Can I use an item that has been given to me as a gift from a state sponsored or an NGO-funded freebie distribution programme to get discounts through exchange offers?" }
    , { result = "You can order the product, which is out of stuck or temporarily unavailable.", query = "Can I order a product that is 'Out of Stock' or 'Temporarily Unavailable'?" }
    , { result = "There are no hidden charges or fees.", query = "Are there any hidden charges (Octroi or Sales Tax) when I shop on E-asy?" }
    , { result = "We will pay you in cash, or transfer to your bank account.", query = "How do you process Refund for an order, purchased using a Gift Card?" }
    , { result = "You can track your order in our website by entering your order number in the tracking orders section.", query = "How can I track the status of my Refund?" }
    , { result = "Around one month.", query = "When can I expect refund for my returned item?" }
    , { result = "You can pay on cash or any credit card.", query = "What are the different modes of payment available?" }
    , { result = "When adding item to the cart, you can choose, which counrty to ship from. and that means the product is made of that country", query = "Where am I buying the item from?"}
    , { result = "Each product has its own gurantee period.", query = "How long is the product guaranteed for?"}
    , { result = "It may take up to 90 days for the item to recieve. if you did not, you can contact us.", query = "How long will it take for the product to arrive?"}
    , { result = "Yes, we have discounts as well. they are coming only in special days!", query = "Do you have any discount program?"}
    , { result = "Everything thing regarding the terms and warranty are written in the warranty card.", query = "Is the return and refund process well-defined with clear deadlines?"}
    , { result = "We will not send you other products than the ones you buy.", query = "Is it how it looks in the picture?"}
    , { result = "You will be prompted to the privacy of payments, when you want to pay.", query = "How to know the privacy and Security of payment system?"}
    , { result = "Different products have free shipping, but not all products are shipped for free.", query = "Is shipping included in the price?"}
    , { result = "You can have a loot to the reviews of the products.", query = "How can I ensure the quality"}
    , { result = "We encourage our customers to buy our products only in our website. buying our products over the internet might be a trap and hence we do not gurrantee that.", query = "Is the payment method safe?"}
    , { result = "Each product has its own warantee period. You can see that when purchasing the product.", query = "How long is the warantee and what services are associated with it? (e.g. is it possible to have item repaired by the store without cost for at least 2 years)"}
    , { result = "You can cancel your order at any time, before payment.", query = "Is it possible to cancel the item?"}
    , { result = "Our website is 100% secure for payments.", query = "Is your website secure to pay?"}
    , { result = "Except the cost and shipping, there are no other costs included. the taxes are included in the item price.", query = "Will there be custom clearance required (pay customs) while shipping this item to my country?"}
    , { result = "Each product has its own lifespan. please read it before buying.", query = "What is the expected lifespan of the item? (e.g. does it work without problems for at least 2 years)?"}
    , { result = "You can return it back to us, and if we get it without damage, we will pay you back. there is no limitation for time.", query = "If I'm not satisfied with the product, how many days I have to return it?"}
    , { result = "Each product has its own insurance, if you purchase it while buying.", query = "Does the item come with insurance?"}
    , { result = "You will only have to pay the shipping costs.", query = "If I'm not satisfied with the product, do I have to pay for returning the product?"}
    , { result = "All our prices are reasonable enough to buy.", query = "Is the price reasonable? (i.e. does it match item's parameters and is not significantly higher than price of similar products on the market)?"}
    , { result = "You will get exactly the same product as you see in our store. please read about the item carefully, we do not gurranty if it meets your needs.", query = "Does the item really meet my actual needs?"}
    , { result = "You will get exactly the same product as you see in our store. please read about the item carefully.", query = "is the real device as the same as in the product page?"}
    , { result = "We have loyality points system for our regular customers only. those who already have accounts in our store.", query = "Is there a loyalty discount for shopping in store?"}
    , { result = "Your delivery information is sent to UPS immediately after your payment is processed, so it's difficult to change this after your order has been placed. Please enter your address details carefully!If you do need to change your shipping address, please contact us as soon as possible.", query = "Can I change my delivery address?"}
    , { result = "Define Instruments products are designed and manufactured in Slovakia according to rigorous quality standards. We are an established company and our products have been field tested for more than 15 years.", query = "Do you sell quality products?"}
    , { result = "Any item(s) purchased on our website are eligible for return, provided they are in new condition as detailed in our Returns Policy.", query = "Which products can be returned?"}
    , { result = "It is really up to you. if you want to buy item with VAT, then you don't have to pay for VAT somewhere else.", query = "Is VAT charged and included in the price?"}
    , { result = "Please try again in a little while. If the payment is still not accepted, please verify your account balance. If everything is as it should, but you still can't make the payment, please contact us@e-asy.com notify us about the problem. We can manage the order manually.", query = "What should I do if the payment is not accepted?"}
    , { result = "Please register in our website in the registration section to create an account.", query = "How do create an account?"}
    , { result = "You can call us on 01234567 and we will reset your password.", query = "How can I retrieve my password? Or how can I reset it?"}
    , { result = "You will be notified about your order, each time a new process is begun.", query = "Will I be notified about my order?"}
    , { result = "We endeavour to process all orders within 3 working days. Orders placed during a sale or promotional period may take up to 5 working days to be processed.", query = "When will my order be processed?"}
    , { result = "we cannot apply discounts after the order has been placed as our merchant takes payment at time of purchase and discounts are outside the capabilities of our refund system. Please note, the sign up discount is a single use code with no expiry for use on full-priced products only.", query = "I forgot to apply a promo code to my order. will you refund me the discount?"}
    , { result = "if you have any querys you can email contact@e-asy.com​​​​​​​", query = "Is there someone, I can contact directly with?"}
    , { result = "If you never received your order, you can contact us to our email address.", query = "What do I do, if I never received my order?"}
    , { result = "We are open 24/7 a week. you can order at anytime.", query = "What are your working hours?"}
    , { result = "If you pay for the fast shipping, you will get the item fast.", query = "How can i get my item via fast shipping?"}
    , { result = "You can see the prices only in the store's currency.", query = "Can I view the prices in my local currency?"}
    , { result = "You can use a maximum of two gift vouchers for a single order.", query = "How many gift vouchers can I use for my order?"}
    , { result = "Items bought on sale are not elligible to return.", query = "I bought something on sale, can I return it?"}
    , { result = "If the tracking has not updated, it might mean the package hasn’t yet been picked up.", query = "Why is my tracking number not updating?"}
    , { result = "Hello there, please ask your querys, here and we will try to result.", query = "Hello morning afternoon evening hi hey" }
    , { result = "Good bye!", query = "bye thankyou thanks" }
    ]
