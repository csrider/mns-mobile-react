/* A message item is the actual launchable message.
 * It has the name of the message, as well as possibly an icon, color, and other options.
 */

function MessageItem(props) {
  const messageData = props.msgData;

  function launchMessage() {
    console.log("launchMessage for " + messageData.name);
  }

  return (
    <div
      onClick={launchMessage}
      className="message-item-container"
      id={"message-item-id-" + messageData.key}
    >
      <img src={messageData.icon} alt="" />
      <span>{messageData.name}</span>
    </div>
  );
}

export default MessageItem;
