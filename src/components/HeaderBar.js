function HeaderBar(props) {
  return (
    <div className="header-bar" id="app-title-container">
      <h1 className="header-text">{props.text}</h1>
      <a class="header-menu">[=]</a>
    </div>
  );
}

export default HeaderBar;
