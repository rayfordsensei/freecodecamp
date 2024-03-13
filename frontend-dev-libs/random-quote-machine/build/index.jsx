"use strict";
const quoteBox = document.getElementById("quote-box");
function Quote({ index }) {
    return (<div id="quote">
                <div id="quote-text">
                <i className="fa-solid fa-angles-left"></i>
                    <span id="text">{quotes[index].quote}</span>
                <i className="fa-solid fa-angles-right"></i>
                </div>
                <div id="quote-author">
                    <span id="author"> - {quotes[index].author}</span>
                </div>
                </div>);
}
function getRandomIntInclusive(min, max) {
    const minCeiled = Math.ceil(min);
    const maxFloored = Math.floor(max);
    return Math.floor(Math.random() * (maxFloored - minCeiled + 1) + minCeiled);
}
function SocialMediaButton({ index, bgColor }) {
    return (<>
                <a id="tweet-quote" href={`https://twitter.com/intent/tweet?hashtags=quotes&text="${quotes[index].quote} ${quotes[index].author}"`} target="_blank" rel="noreferrer" style={{ backgroundColor: bgColor }} title="Tweet this!"><i className="fa-brands fa-x-twitter" title="Tweet this!"></i></a>
                </>);
}
function HomePage() {
    const [quoteIndex, setQuoteIndex] = React.useState(getRandomIntInclusive(0, quotes.length - 1));
    const [color, setColor] = React.useState(colors[getRandomIntInclusive(0, colors.length - 1)]);
    document.body.style.backgroundColor = color;
    document.getElementById("quote-box").style.color = color;
    function handleClick() {
        setQuoteIndex(getRandomIntInclusive(0, quotes.length - 1));
        setColor(colors[getRandomIntInclusive(0, colors.length - 1)]);
    }
    return (<>
                    <Quote index={quoteIndex}/>
                    <div id="buttons">
                        <button onClick={handleClick} id="new-quote" style={{ backgroundColor: color }}>New quote</button>
                        <SocialMediaButton index={quoteIndex} bgColor={color}/>
                    </div>
                </>);
}
const root = ReactDOM.createRoot(quoteBox);
root.render(<HomePage />);
