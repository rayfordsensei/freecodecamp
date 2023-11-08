/*
One of the simplest and most widely known ciphers is a Caesar cipher, also known as a shift cipher. In a shift cipher the meanings of the letters are shifted by some set amount.

A common modern use is the ROT13 cipher, where the values of the letters are shifted by 13 places. Thus A ↔ N, B ↔ O and so on.

Write a function which takes a ROT13 encoded string as input and returns a decoded string.

All letters will be uppercase. Do not transform any non-alphabetic character (i.e. spaces, punctuation), but do pass them on.
*/

function setCharAt(str, index, chr) // https://stackoverflow.com/questions/1431094
{
    if (index > str.length - 1) return str;
    return str.substring(0, index) + chr + str.substring(index + 1);
}

function rot13(str)
{
    let ans = str.slice(); const regex = /[A-Z]/;
    for (let i = 0; i < ans.length; i++)
        if (regex.test(ans[i]))
        {
            if (ans.charCodeAt(i) + 13 > 90) ans = setCharAt(ans, i, String.fromCharCode(ans.charCodeAt(i) - 13));
            else ans = setCharAt(ans, i, String.fromCharCode(ans.charCodeAt(i) + 13));
        }
    return ans;
}

rot13("SERR PBQR PNZC");
