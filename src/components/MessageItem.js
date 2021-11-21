/* A message item is the actual launchable message.
 * It has the name of the message, as well as possibly an icon, color, and other options.
 */

function MessageItem(props) {
  const message = props.msgData;

  function launchMessage() {
    console.log("launchMessage for " + message.name);
  }

  return (
    <div
      onClick={launchMessage}
      className="message-item-container"
      id={"message-item-id-" + message.key}
    >
      <img src={message.icon} alt="" />
      <span>{message.name}</span>
    </div>
  );
}

export default MessageItem;
