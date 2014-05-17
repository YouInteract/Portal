function setHeartbeat() {
                setTimeout("heartbeat()", 180000); // every 5 min
            }

function heartbeat() {
    $.get(
        "../SessionHeartbeat.ashx",
        null,
        function(data) {
            //$("#heartbeat").show().fadeOut(1000); // just a little "red flash" in the corner :)
            setHeartbeat();
        }
    );
}

setHeartbeat();