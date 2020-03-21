import React, { useState } from "react";
import { Button } from "@material-ui/core";

function Test() {
  const [counter, setCounter] = useState(0);
  return (
    <div>
      <Button color="primary" onClick={() => setCounter(counter + 1)}>
        +
      </Button>
      {counter}
    </div>
  );
}

export default Test;
