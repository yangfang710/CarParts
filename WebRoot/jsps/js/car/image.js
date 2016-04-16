/**
    
    qsoft.PopBigImage
    
    version：0.2
    author： kimmking@163.com
    date：   2009年3月25日3:54:50
    
    功能描述：
    一般页面的的图片为了布局考虑，显示大小都小于实际大小。
    鼠标在图片上移动时，在旁边展示一个跟此图片显示大小一样的层。
    并讲鼠标附近区域对应的原始图片的区域按原始大小显示在这个层中。
    
    v0.1：实现了IE下的鼠标滑动小图动态展示对应的放大局部图的功能。
    v0.2：实现了Firefox的兼容支持，修改了IE下传递偏移0,0时有空隙的对不齐问题。
    
    
    参数描述：
    origImageId： 要绑定的img对象的id
    dx：展示大图相对于绑定的img对象右方的x轴偏移量
    dy：展示大图相对于绑定的img对象上方的y轴偏移量
    
    
    用法：
    window.onload = function(){
        var pbi = new qsoft.PopBigImage("orig",20,0);  
        pbi.render();        
    }
    
    **/
   
   
   
    var qsoft = { 
        version : 0.2,
        isIE : document.all?true:false
    }
    
    qsoft.PopBigImage = function (origImageId,dx,dy)
    {
        this.oim = document.getElementById(origImageId);
        
        this.oim.style.cursor = "crosshair";
        
        this.ow = this.oim.width;
        this.oh = this.oim.height;
        
        this.detaX = (typeof(dx) == "undefined")?30 : dx;
        this.detaY = (typeof(dy) == "undefined")?0 : dy;
        
        this.getAbsSize = function (obj)
        {
            return obj.getBoundingClientRect();
        };
        
        var rect = this.getAbsSize(this.oim);
        this.ol = rect.left + this.detaX + this.ow - (qsoft.isIE ?2:0);
        this.ot = rect.top + this.detaY - (qsoft.isIE ?2:0);
        
        this.src = this.oim.src;
        
        this.getImageSize = function (img)
        {
            var im = new Image();
            im.src = img.src;
            
            var size = {};
            size.width = im.width;
            size.height = im.height;
            
            im = null;
            delete im;
            
            return size;
        };
        
        var rsize = this.getImageSize(this.oim);
        this.w = rsize.width;
        this.h = rsize.height;
        
        var qObj = this;
        
        this.createMask = function ()
        {
            if(typeof(this.mask) == "undefined")
            {
                this.mask = document.createElement("div");
                
                this.mask.style.position  = "absolute";
                this.mask.style.width = this.ow + "px";
                this.mask.style.height = this.oh + "px";
                this.mask.style.left = this.ol + "px";
                this.mask.style.top = this.ot + "px";    
                this.mask.style.backgroundImage  = "url("+this.src+")";
                this.mask.style.backgroundRepeat = "no-repeat";     
                this.mask.style.display ="none";    
                
                document.body.appendChild(this.mask);      
            }
        };
        
        this.regEvent = function ()
        {
            this.oim.onmousemove = function ()
            {
            
                var e = arguments[0] || window.event;
                
                var sz = qObj.getAbsSize(e.target|| e.srcElement);
                
                var ox = qsoft.isIE ? e.offsetX: (e.pageX - sz.left);
                var oy = qsoft.isIE ? e.offsetY: (e.pageY - sz.top);
                
                var x = Math.ceil(ox * qObj.w/qObj.ow) - qObj.ow/2;
                var y = Math.ceil(oy * qObj.h/qObj.oh) - qObj.oh/2;
           
               if(x<0) x = 0;
               if(y<0) y = 0;
               
               var maxx = Math.ceil((qObj.w-qObj.ow));
               var maxy = Math.ceil((qObj.h-qObj.oh));
               
               if(x>maxx) x = maxx;
               if(y>maxy) y = maxy;
               
               qObj.mask.style.backgroundPosition = -x  + "px " + -y + "px"; 
 
            };
            
            this.oim.onmouseout = function ()
            {
                qObj.mask.style.display = "none";
            };
            
            this.oim.onmouseover = function ()
            {
                qObj.mask.style.display = "block";
            };
            
        };
        
        this.render = function ()
        {
            this.createMask();
            this.regEvent();
        }; 
        
    };