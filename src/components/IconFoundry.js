// Icons and their names:
// https://react-icons.github.io/react-icons/icons?name=fc

import * as Icons from "react-icons/fc";

function IconFoundry(props) {

    const IconGetter = ({iconName}) => {
        const IconComponent = Icons[iconName];

        if (!IconComponent) {
            return null;
        }

        return <IconComponent />;
    }

    return (
        <span className="icon">
            <IconGetter iconName={props.iconName} />
        </span>
    )
}

export default IconFoundry;