// @ts-expect-error Importing JS, couldn't care less to figure it out
declare const quotes: typeof import("../public/quotes");
// @ts-expect-error Importing JS, couldn't care less to figure it out
declare const colors: typeof import("../public/colors"); // https://codepen.io/hezag/pen/ZGxOLX

declare const React: typeof import("react");
declare const ReactDOM: typeof import("react-dom/client");


const quoteBox = document.getElementById("quote-box")!

        function Quote({ index }: { index: number }) 
        {
            return (
                <div id="quote">
                <div id="quote-text">
                <i className="fa-solid fa-angles-left"></i>
                    <span id="text">{quotes[index].quote}</span>
                <i className="fa-solid fa-angles-right"></i>
                </div>
                <div id="quote-author">
                    <span id="author"> - {quotes[index].author}</span>
                </div>
                </div>
            )
        }

        function getRandomIntInclusive(min: number, max: number)
        {   // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

            const minCeiled = Math.ceil(min);
            const maxFloored = Math.floor(max);
            return Math.floor(Math.random() * (maxFloored - minCeiled + 1) + minCeiled);
        }
          
        function SocialMediaButton({ index, bgColor }: { index: number, bgColor: string }) 
        {
            return (
                <>
                <a id="tweet-quote" href={`https://twitter.com/intent/tweet?hashtags=quotes&text="${quotes[index].quote} ${quotes[index].author}"`} target="_blank" rel="noreferrer" style={{backgroundColor: bgColor}} title="Tweet this!"><i className="fa-brands fa-x-twitter" title="Tweet this!"></i></a>
                </>
            )
        }

        function HomePage()
        {
            const [quoteIndex, setQuoteIndex] = React.useState(getRandomIntInclusive(0, quotes.length - 1));
            const [color, setColor] = React.useState(colors[getRandomIntInclusive(0, colors.length - 1)]);

            document.body.style.backgroundColor = color;
            document.getElementById("quote-box")!.style.color = color;

            function handleClick()
            {
                setQuoteIndex(getRandomIntInclusive(0, quotes.length - 1));
                setColor(colors[getRandomIntInclusive(0, colors.length - 1)]);
            }

            return (
                <>
                    <Quote index = {quoteIndex} />
                    <div id="buttons">
                        <button onClick = { handleClick } id="new-quote" style={{backgroundColor: color}}>New quote</button>
                        <SocialMediaButton index = {quoteIndex} bgColor={color} />
                    </div>
                </>
            )
        }

                const root = ReactDOM.createRoot(quoteBox);
                root.render(<HomePage />);
