<%@page import="java.util.ArrayList"%>
<%@page import="function.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      <link rel="icon" href=" ">
      <title>Gamelord News Page | Game Developer Company</title>

      <!-- Bootstrap core CSS -->
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <!-- Custom styles for this template -->
      <link href="css/custom.css" rel="stylesheet">

      <!-- Helper Styles -->
      <link href="css/loaders.css" rel="stylesheet">
      <link href="css/swiper.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/animate.min.css">
      <link rel="stylesheet" href="css/animation.css">
      <link rel="stylesheet" href="css/nivo-lightbox.css">
      <link rel="stylesheet" href="css/nivo_themes/default/default.css">
      <link rel="stylesheet prefetch" href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css">

      <!-- Font Awesome Style Icon -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <!-- Header
         ================================================== -->
        <jsp:include page="header.jsp"/>

        <%
            NewsDAO abc = new NewsDAO();
            ArrayList<NewsDTO> listOfNews = abc.getAllNews();
        %>

        <!-- News
          ================================================== -->
        <section class="service-sec" id="benefits">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading text-md-center text-xs-center">
                            <h2>NEWS</h2>
                        </div>
                    </div>

                    <!--Start loop to show news-->
                    <%
                        for (int i = 0; i < listOfNews.size(); i++) {
                            String content = listOfNews.get(i).getContent();
                            if (content.contains("<br>")) {
                                String[] temp = content.split("<br>");
                                content = temp[0] + " ...";
                            }
                    %>

                    <div class="col-md-4 blog-box" data-aos="fade-down">
                        <h3 class="blog-title"><a href="/news?viewnews=<%=i%>&action=details"><%=listOfNews.get(i).getTitle()%></a></h3>
                        <div class="blog-image-block"> <img src="<%=listOfNews.get(i).getImage()%>" alt="" class="img-fluid"> </div>
                        <p class="blog-content"><%=content%></p>
                        <p class="blog-content">
                          <form>
                              <input type="hidden" name="viewnews" value="<%=i%>">
                              <button type="submit" name="action" value="details" >Read more </button>
                          </form>
                        </p>
                    </div>
                    <% } %>
                    <!--End loop-->

                </div>
                <!-- /.row -->
            </div>

        </section>

        <!-- Footer
         ================================================== -->
        <jsp:include page="footer.jsp"/>

        <!-- Bootstrap core JavaScript
          ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/nivo-lightbox.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/core.js"></script>
        <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>


        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>


        <script>// Variables
            "use strict";
            !function (t) {
                t.fn.tilt = function (s) {
                    var i = function () {
                        this.ticking || (requestAnimationFrame(g.bind(this)), this.ticking = !0);
                    }, e = function () {
                        t(this).on("mousemove", r), t(this).on("mouseenter", n), this.settings.reset && t(this).on("mouseleave", l);
                    }, a = function () {
                        var s = this;
                        void 0 !== this.timeout && clearTimeout(this.timeout), t(this).css({transition: this.settings.speed + "ms " + this.settings.easing}), this.settings.glare && this.glareElement.css({transition: "opacity " + this.settings.speed + "ms " + this.settings.easing}), this.timeout = setTimeout(function () {
                            t(s).css({transition: ""}), s.settings.glare && s.glareElement.css({transition: ""});
                        }, this.settings.speed);
                    }, n = function (s) {
                        this.ticking = !1, t(this).css({"will-change": "transform"}), a.call(this), t(this).trigger("tilt.mouseEnter");
                    }, h = function (s) {
                        return "undefined" === typeof s && (s = {pageX: t(this).offset().left + t(this).outerWidth() / 2, pageY: t(this).offset().top + t(this).outerHeight() / 2}), {x: s.pageX, y: s.pageY};
                    }, r = function (t) {
                        this.mousePositions = h(t), i.call(this);
                    }, l = function () {
                        a.call(this), this.reset = !0, i.call(this), t(this).trigger("tilt.mouseLeave");
                    }, o = function () {
                        var s = t(this).width(), i = t(this).height(), e = t(this).offset().left, a = t(this).offset().top, n = (this.mousePositions.x - e) / s, h = (this.mousePositions.y - a) / i, r = (this.settings.maxTilt / 2 - n * this.settings.maxTilt).toFixed(2), l = (h * this.settings.maxTilt - this.settings.maxTilt / 2).toFixed(2), o = Math.atan2(this.mousePositions.x - (e + s / 2), -(this.mousePositions.y - (a + i / 2))) * (180 / Math.PI);
                        return{tiltX: r, tiltY: l, percentageX: 100 * n, percentageY: 100 * h, angle: o};
                    }, g = function () {
                        return this.transforms = o.call(this), this.reset ? (this.reset = !1, t(this).css("transform", "perspective(" + this.settings.perspective + "px) rotateX(0deg) rotateY(0deg)"), void(this.settings.glare && (this.glareElement.css("transform", "rotate(180deg) scale(1.75)"), this.glareElement.css("opacity", "" + this.settings.maxGlare / 4)))) : (t(this).css("transform", "perspective(" + this.settings.perspective + "px) rotateX(" + ("x" === this.settings.axis ? 0 : this.transforms.tiltY) + "deg) rotateY(" + ("y" === this.settings.axis ? 0 : this.transforms.tiltX) + "deg) scale3d(" + this.settings.scale + "," + this.settings.scale + "," + this.settings.scale + ")"), this.settings.glare && (this.glareElement.css("transform", "rotate(" + this.transforms.angle + "deg) scale(1.75)"), this.glareElement.css("opacity", "" + this.transforms.percentageY * this.settings.maxGlare / 100)), t(this).trigger("change", [this.transforms]), void(this.ticking = !1));
                    }, c = function () {
                        if (!this.settings.glarePrerender) {
                            t(this).append('<div class="js-tilt-glare"><div class="js-tilt-glare-inner"></div></div>'), this.glareElementWrapper = t(this).find(".js-tilt-glare"), this.glareElement = t(this).find(".js-tilt-glare-inner");
                            var s = {position: "absolute", top: "0", left: "0", width: "100%", height: "100%"};
                            this.glareElementWrapper.css(s).css({overflow: "hidden"}), this.glareElement.css(s).css({"background-image": "linear-gradient(0deg, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%)", opacity: "" + this.settings.maxGlare / 2, transform: "rotate(180deg) scale(1.75)"});
                        }
                    };
                    return t.fn.tilt.destroy = function () {
                        t(this).each(function () {
                            t(this).find(".js-tilt-glare").remove(), t(this).css({"will-change": "", transform: ""}), t(this).off("mousemove mouseenter mouseleave");
                        });
                    }, t.fn.tilt.getValues = function () {
                        var s = [];
                        return t(this).each(function () {
                            this.mousePositions = h.call(this), s.push(o.call(this));
                        }), s;
                    }, t.fn.tilt.reset = function () {
                        t(this).each(function () {
                            var s = this;
                            this.mousePositions = h.call(this), this.settings = t(this).data("settings"), l.call(this), setTimeout(function () {
                                s.reset = !1;
                            }, this.settings.transition);
                        });
                    }, this.each(function () {
                        var i = this;
                        this.settings = t.extend({maxTilt: t(this).is("[data-tilt-max]") ? t(this).data("tilt-max") : 20, perspective: t(this).is("[data-tilt-perspective]") ? t(this).data("tilt-perspective") : 300, easing: t(this).is("[data-tilt-easing]") ? t(this).data("tilt-easing") : "cubic-bezier(.03,.98,.52,.99)", scale: t(this).is("[data-tilt-scale]") ? t(this).data("tilt-scale") : "1", speed: t(this).is("[data-tilt-speed]") ? t(this).data("tilt-speed") : "400", transition: !t(this).is("[data-tilt-transition]") || t(this).data("tilt-transition"), axis: t(this).is("[data-tilt-axis]") ? t(this).data("tilt-axis") : null, reset: !t(this).is("[data-tilt-reset]") || t(this).data("tilt-reset"), glare: !!t(this).is("[data-tilt-glare]") && t(this).data("tilt-glare"), maxGlare: t(this).is("[data-tilt-maxglare]") ? t(this).data("tilt-maxglare") : 1}, s), this.init = function () {
                            t(i).data("settings", i.settings), i.settings.glare && c.call(i), e.call(i);
                        }, this.init();
                    });
                }, t("[data-tilt]").tilt();
            }(jQuery);


            // $('.card').tilt({
            //     // axis: X
            // });
            // }(jQuery);

            AOS.init({
                duration: 1200
            });
            //# sourceURL=pen.js
        </script>
    </body>
</html>
