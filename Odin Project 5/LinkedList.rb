class LinkList
    attr_accessor :header

    def initialize(value)
        node = Node.new(value)
        @header = node;
        # @tail = node
    end

    def append(value)
        newnode = Node.new(value);
        pres = header;
        while(pres.link != nil)
            pres = pres.link;
        end
        pres.link = newnode
    end

    def prependv(value)
        newnode = Node.new(value)
        newnode.link = header
        @header = newnode
    end

    def size
        count = 0
        pres = header;
        while(pres!=nil)
            count+=1
            pres = pres.link
        end
        return count;
    end

    def head
        return header
    end

    def tail
        pres = header
        while(pres.link!=nil)
            pres = pres.link
        end
        return pres
    end

    def at(ix)
        n = size
        if ix>=n
            puts "Index is more than size of link list"
        else
            pres = header;
            i=1
            while i<n && i < ix
                # puts pres
                pres = pres.link
                i+=1
            end
            return pres
        end

    end

    def pop
        pres = header
        prev = nil
        while(pres.link!=nil)
            prev = pres
            pres = pres.link
        end
        prev.link = nil
        return pres
    end

    def contains?(value)
        pres = header;
        until pres == nil
            # puts pres
            if(pres.data == value) 
                return true
            end
            pres = pres.link
        end
        return false
    end

    def find(value)
        pres = header;
        i=1
        until pres == nil
            # puts pres
            if(pres.data == value)
                return i
            end
            i+=1
            pres = pres.link
        end
        return nil
    end

    def to_s
        # res = "(#{header.data}) -> "
        res = ""
        pres = header;
        prev = nil;
        while(pres != nil)
            prev = pres;
            pres = pres.link;
            if prev.link != nil 
                res += "(#{prev.data}) -> "
            else
                res += "(#{prev.data})"
            end
        end
        return res;
    end
end

# string += "( #{node.value} ) -> nil" if last_node?(node)
class Node
    attr_accessor :data , :link 
    def initialize(value = nil, nextv = nil)
        @data = value
        @link = nextv
    end

    def to_s
        return "value->#{data}"
    end
end


list = LinkList.new(100)
list.append(300)
list.append(500)
list.prependv(50)
# puts list.size
# puts list.head
# puts list.tail
# puts list.at(2)
list.append(700)
puts list
# puts list.pop
# puts list

puts list.contains?(300)
puts list.contains?(900)


puts list.find(300)
puts list.find(900)
