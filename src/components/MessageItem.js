/* A message item is the actual launchable message.
 * It has the name of the message, as well as possibly an icon, color, and other options.
 */


function MessageItem(props) {
    return (
        <div className="message-item-container">
            <img src={props} alt="" />
            <span>{props.name}</span>
        </div>
    )
}

export default MessageItem;