/**
    
    qsoft.PopBigImage
    
    version��0.2
    author�� kimmking@163.com
    date��   2009��3��25��3:54:50
    
    ����������
    һ��ҳ��ĵ�ͼƬΪ�˲��ֿ��ǣ���ʾ��С��С��ʵ�ʴ�С��
    �����ͼƬ���ƶ�ʱ�����Ա�չʾһ������ͼƬ��ʾ��Сһ���Ĳ㡣
    ������긽�������Ӧ��ԭʼͼƬ������ԭʼ��С��ʾ��������С�
    
    v0.1��ʵ����IE�µ���껬��Сͼ��̬չʾ��Ӧ�ķŴ�ֲ�ͼ�Ĺ��ܡ�
    v0.2��ʵ����Firefox�ļ���֧�֣��޸���IE�´���ƫ��0,0ʱ�п�϶�ĶԲ������⡣
    
    
    ����������
    origImageId�� Ҫ�󶨵�img�����id
    dx��չʾ��ͼ����ڰ󶨵�img�����ҷ���x��ƫ����
    dy��չʾ��ͼ����ڰ󶨵�img�����Ϸ���y��ƫ����
    
    
    �÷���
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