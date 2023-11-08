/*
Convert the given number into a roman numeral.
Roman numerals 	Arabic numerals
M 	1000
CM 	900
D 	500
CD 	400
C 	100
XC 	90
L 	50
XL 	40
X 	10
IX 	9
V 	5
IV 	4
I 	1

All roman numerals answers should be provided in upper-case.
*/

function convertToRoman(num)
{
    const romanNumerals = [{ 'I': 1 }, { 'IV': 4 }, { 'V': 5 }, { 'IX': 9 }, { 'X': 10 }, { 'XL': 40 }, { 'L': 50 }, { 'XC': 90 }, { 'C': 100 }, { 'CD': 400 }, { 'D': 500 }, { 'CM': 900 }, { 'M': 1000 }];
    let i = 12; let ans = '';
    while (num)
    {
        let div = Math.trunc(num / Number(Object.values(romanNumerals[i])));
        num = num % Number(Object.values(romanNumerals[i]));
        while (div)
        {
            ans += Object.keys(romanNumerals[i]);
            div--;
        }
        i--;
    }
    return ans;
}

convertToRoman(3999);
