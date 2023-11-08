/*
Design a cash register drawer function checkCashRegister() that accepts purchase price as the first argument (price), payment as the second argument (cash), and cash-in-drawer (cid) as the third argument.

cid is a 2D array listing available currency.

The checkCashRegister() function should always return an object with a status key and a change key.

Return {status: "INSUFFICIENT_FUNDS", change: []} if cash-in-drawer is less than the change due, or if you cannot return the exact change.

Return {status: "CLOSED", change: [...]} with cash-in-drawer as the value for the key change if it is equal to the change due.

Otherwise, return {status: "OPEN", change: [...]}, with the change due in coins and bills, sorted in highest to lowest order, as the value of the change key.
Currency Unit	Amount
Penny	$0.01 (PENNY)
Nickel	$0.05 (NICKEL)
Dime	$0.1 (DIME)
Quarter	$0.25 (QUARTER)
Dollar	$1 (ONE)
Five Dollars	$5 (FIVE)
Ten Dollars	$10 (TEN)
Twenty Dollars	$20 (TWENTY)
One-hundred Dollars	$100 (ONE HUNDRED)

See below for an example of a cash-in-drawer array:

[
  ["PENNY", 1.01],
  ["NICKEL", 2.05],
  ["DIME", 3.1],
  ["QUARTER", 4.25],
  ["ONE", 90],
  ["FIVE", 55],
  ["TEN", 20],
  ["TWENTY", 60],
  ["ONE HUNDRED", 100]
]
*/

// eslint-disable-next-line complexity, sonarjs/cognitive-complexity
function checkCashRegister(price, cash, cid)
{
    const register = { status: "OPEN", change: [...cid] };
    let diff = cash - price;
    let cidWeight = 0;

    for (let i = 0; i < cid.length; i++)
        cidWeight += cid[i][1];
    if (diff === cidWeight) return { status: 'CLOSED', change: cid };
    if (cidWeight < diff) return { status: 'INSUFFICIENT_FUNDS', change: [] };
    const temp = [];
    const bill = [{ 'PENNY': 0.01 }, { 'NICKEL': 0.05 }, { 'DIME': 0.1 }, { 'QUARTER': 0.25 }, { 'ONE': 1 }, { 'FIVE': 5 }, { 'TEN': 10 }, { 'TWENTY': 20 }, { 'ONE HUNDRED': 100 }];
    while (diff > 0)
    {
        let bills = 0;
        if (diff >= 100)
        {
            bills = 0;
            while (diff >= 100 && register.change[8][1] >= 100)
            {
                bills++;
                diff -= 100;
                register.change[8][1] -= 100;
            }
            temp.push([String(Object.keys(bill[8])), bills * Object.values(bill[8])]);
        }
        if (diff >= 20)
        {
            bills = 0;
            while (diff >= 20 && register.change[7][1] >= 20)
            {
                bills++;
                diff -= 20;
                diff = parseFloat(diff).toFixed(2);
                register.change[7][1] -= 20;
            }
            temp.push([String(Object.keys(bill[7])), bills * Object.values(bill[7])]);
        }
        if (diff >= 10)
        {
            bills = 0;
            while (diff >= 10 && register.change[6][1] >= 10)
            {
                bills++;
                diff -= 10;
                diff = parseFloat(diff).toFixed(2);
                register.change[6][1] -= 10;
            }
            temp.push([String(Object.keys(bill[6])), bills * Object.values(bill[6])]);
        }
        if (diff >= 5)
        {
            bills = 0;
            while (diff >= 5 && register.change[5][1] >= 5)
            {
                bills++;
                diff -= 5;
                diff = parseFloat(diff).toFixed(2);
                register.change[5][1] -= 5;
            }
            temp.push([String(Object.keys(bill[5])), bills * Object.values(bill[5])]);
        }
        if (diff >= 1)
        {
            bills = 0;
            while (diff >= 1 && register.change[4][1] >= 1)
            {
                bills++;
                diff -= 1;
                diff = parseFloat(diff).toFixed(2);
                register.change[4][1] -= 1;
            }
            temp.push([String(Object.keys(bill[4])), bills * Object.values(bill[4])]);
        }
        if (diff >= 0.25)
        {
            bills = 0;
            while (diff >= 0.25 && register.change[3][1] >= 0.25)
            {
                bills++;
                diff -= 0.25;
                diff = parseFloat(diff).toFixed(2);
                register.change[3][1] -= 0.25;
            }
            temp.push([String(Object.keys(bill[3])), bills * Object.values(bill[3])]);
        }
        if (diff >= 0.1)
        {
            bills = 0;
            while (diff >= 0.1 && register.change[2][1] >= 0.1)
            {
                bills++;
                diff -= 0.1;
                diff = parseFloat(diff).toFixed(2);
                register.change[2][1] -= 0.1;
            }
            temp.push([String(Object.keys(bill[2])), bills * Object.values(bill[2])]);
        }
        if (diff >= 0.05)
        {
            bills = 0;
            while (diff >= 0.05 && register.change[1][1] >= 0.05)
            {
                bills++;
                diff -= 0.05;
                diff = parseFloat(diff).toFixed(2);
                register.change[1][1] -= 0.05;
            }
            temp.push([String(Object.keys(bill[1])), bills * Object.values(bill[1])]);
        }
        if (diff >= 0.01)
        {
            bills = 0;
            while (diff >= 0.01 && register.change[0][1] >= 0.01)
            {
                bills++;
                diff -= 0.01;
                diff = parseFloat(diff).toFixed(2);
                register.change[0][1] -= 0.01;
            }
            temp.push([String(Object.keys(bill[0])), bills * Object.values(bill[0])]);
        }
        if (diff > 0) return { status: 'INSUFFICIENT_FUNDS', change: [] };
    }
    return { status: 'OPEN', change: temp };
}

checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]])
checkCashRegister(3.26, 100, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]])
checkCashRegister(19.5, 20, [["PENNY", 0.01], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 0], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]])
checkCashRegister(19.5, 20, [["PENNY", 0.01], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 1], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]])
checkCashRegister(19.5, 20, [["PENNY", 0.5], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 0], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]])
