import HeaderBar from "./HeaderBar";
import MessageItem from "./MessageItem";

function MessageSection(props) {
    return (
        
        <div className="message-section">
            <HeaderBar text={props.text} />

            <div className="messages-container">
                <MessageItem msgName="MSG NAME" />
                <MessageItem msgName="MSG NAME" />
            </div>
        </div>
    )
}

export default MessageSection;