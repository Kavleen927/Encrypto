# Encrypto

For the best results, run with the simulator iPhone 12 pro max. 

Upon running and executing the program, the user can choose one of two options: “Encrypt” or “Decrypt” a message. 

After clicking the “Encrypt” button, a view is shown with two encryption techniques. 
On this view, there is a description explaining the two types of techniques: Symmetric vs Asymmetric. 
The two encryption techniques under these subheadings are “Caesar Cipher” and “RSA”, respectively. The user can click any of these buttons which 
will then prompt the user to provide a message and a key/keys. 
For example, after providing a message and a numeric key (cannot be a char or anything other) , the user must click the “Encrypt” button to get the ciphertext. 
For the RSA, the user must have supporting keys, if not, the user can generate a new pair of keys. This process will generate new keys each time. 
When the user has his/her keys, they can click the “I want to Encrypt” button to then provide a message and the public key of the receiver. For this purpose, 
you can provide your own public key and then decrypt using your private key. 
The “Decrypt” does the same only takes the cipher text, and then provide the original message. Clicking “Decrypt” will prompt the technique display 
again and according to your ciphertext (whether it’s a string of chars or an array of numbers) you can click “Caesar Cipher” or “RSA”. 
After this the user can provide the ciphertext and the key that is used to encrypt (CC) or the private key of the corresponding public key that was used to encrypt. 

The user can copy and paste inside and outside the app by clicking the “Copy” buttons in any of the views. Double clicking on input field will invoke the "Paste". 

There is also a small simple challenge for the user to complete within the RSA section in the “Encrypt” path.


The current state of this app features two main encryption techniques: Caesar Cipher and RSA. 
-Information on two techniques: Caesar Cipher and RSA
-Encrypt & Decrypt using Caesar Cipher
-Encrypt & Decrypt using RSA
-Generate a set of RSA keys
-Ease of Access text fields
-Ability to copy and paste text/ciphertext for use outside the app scope using UIPasteboard
-An RSA Challenge

