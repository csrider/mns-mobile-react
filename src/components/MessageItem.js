function MessageItem(props) {
    return (
        <div className="message-item-container">
            <a>{props.msgName}</a>
        </div>
    )
}

export default MessageItem;